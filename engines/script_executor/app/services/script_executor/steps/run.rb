module ScriptExecutor
  module Steps
    class Run
      include ServiceObject
      @host = '127.0.0.1'
      @user = 'nargiz'
      @password = '#zigraN169'
      @path = '/home/nargiz/ruby/stable_version_octoshell/octoshell-v2/tmp/n_private_key'
      def initialize(step)
        @step = step
        # @user = user
      end

      def call
        # binding.pry
        hash = ''
        # @step.actions.each do |action|
        #   result = ssh_connect(action)
        #   hash = { command: action, output: result }
        # end
        ssh_connect_with_chanel
        @step.update(result: hash, status: 'success')
      end

      def ssh_connect(command)
        begin
          Net::SSH.start(@host, @user, keys: ["/home/nargiz/ruby/stable_version_octoshell/octoshell-v2/tmp/n_private_key"], passphrase: 'kesha', password: '#zigraN169' ) do |ssh|
            ssh.exec!(command)
          end
        rescue Timeout::Error
          @error = "  Timed out"
        rescue Errno::EHOSTUNREACH
          @error = "  Host unreachable"
        rescue Errno::ECONNREFUSED
          @error = "  Connection refused"
        rescue Net::SSH::AuthenticationFailed
          @error = "  Authentication failure"
        end
      end

      def ssh_connect_with_chanel
        Net::SSH.start(@host, @user,
                       keys: ["/home/nargiz/ruby/stable_version_octoshell/octoshell-v2/tmp/n_private_key"],
                       passphrase: 'kesha', password: '#zigraN169' ) do |ssh|

          ssh.open_channel do |ch|
            step.actions.each do |command|
              ch.exec command do |channel, success|
                abort "could not execute #{command}" unless success
                channel.on_data do |ch, data|
                  print data
                end
              end
            end
          end
          ssh.loop { ssh.busy? }
        end
      end

      def valid(result)
        if @step.previous.previous_result_need? && @step.previous.result.blank?
          return "Предыдущий шаг #{@step} не имеет рузультата выполнения"
        end
      end

      private
      attr_reader :step
    end
  end
end