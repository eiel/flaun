require 'flaun/config'

module Flaun
  class DSL < BasicObject
    attr_reader :config

    def initialize
      @config = ::Flaun::Config.new
    end

    def port(port)
      @config.port = port
    end

    def target(name, &block)
      target = DSLTarget.new(@config)
      target.instance_exec &block
      @config.targets[name] = target.config
    end
  end

  class DSLTarget < BasicObject
    attr_reader :config

    def initialize(config)
      @config = ::Flaun::TargetConfig.new(config)
    end

    def user(user)
      @config.user = user
    end

    def port(port)
      @config.forward_host_port = port
    end

    def host(host)
      @config.host = host
    end

    def path(path)
      @config.path = path
    end
  end
end
