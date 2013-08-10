module Flaun
  class Config
    attr_accessor :port, :targets

    def initialize
      @targets = {}
      @port = 3000
    end

    def [](name)
      @targets[name]
    end
  end

  class TargetConfig
    attr_accessor :forward_host_port, :host, :path
    attr_reader :user

    def initialize(config)
      @config = config
      @forward_host_port = 80
      @user = ENV['USER']
    end

    def user=(user)
      @user = user
    end

    def forward_port
      @config.port
    end

    def forward_host
      'localhost'
    end

    def access_url
      "http://localhost:#{@config.port}/#{path}"
    end
  end
end
