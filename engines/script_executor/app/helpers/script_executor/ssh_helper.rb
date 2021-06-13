module ScriptExecutor
  module SSHHelper
    host = '127.0.0.1'.freeze
    user = 'nargiz'.freeze
    password = '#zigraN169'
    def script_executor_engine
      @@script_executor_engine_url_helpers ||= ScriptExecutor::Engine.routes.url_helpers
    end

    def ssh_connect(command)
      Net::SSH.start(host, user, password) do |ssh|
        output = ssh.exec!(command)
      end
    end
  end
end
