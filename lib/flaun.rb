require 'flaun/version'
require 'flaun/dsl'
require 'launchy'
require 'net/ssh'

module Flaun
  extend self

  def run(*argv)
    Thread.abort_on_exception = true
    thread = Thread.new do
      start *argv
    end

    loop do
      puts 'quit? (y/N)'
      break if $stdin.gets.chomp == 'y'
    end
    thread.kill
  end

  def config_load(text, filename)
    dsl = Flaun::DSL.new
    dsl.instance_eval text, filename
    dsl.config
  end

  def start(target_name = nil, config_file = nil)
    config_file ||= default_config_file
    unless File.exist? config_file
      not_found_config_file
      exit 1
    end
    config = config_load(open(config_file).read, config_file)

    if target_name.nil?
      not_target_name config
      exit 1
    end

    target = config[target_name.to_sym]

    ssh_forward_and_launch target
  end

  private

    def default_config_file
      Pathname.new("~/.flaun").expand_path.to_s
    end

    def not_found_config_file
      $stderr.puts 'Plaese, create file ~/.flaun'
    end

    def not_target_name(config)
      $stderr.puts 'select target:'
      puts config.targets.keys
    end

    def ssh_forward_and_launch(target)
      Net::SSH.start(target.host, target.user ) do |ssh|
        ssh.forward.local(
          target.forward_port,
          target.forward_host,
          target.forward_host_port)

        Launchy.open( target.access_url )

        ssh.loop { true }
      end
    end
  # end private
end
