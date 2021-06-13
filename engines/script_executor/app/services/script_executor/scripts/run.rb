# require 'add_user_script'

module ScriptExecutor
  module Scripts
    class Run
      include ServiceObject
      host = '127.0.0.1'
      user = 'nargiz'
      attr_accessor :script
      def initialize(script)
        @script = script
      end

      def call
        @script.steps.order(:order).each do |step|
          ScriptExecutor::Steps::Run.call(step)
        end
        update_exec_script

      end

      def update_exec_script
        @script.exec_script.update(success: true) if @script.steps.all?(:success)
      end
    end


# rails s
# cd app/services
# rails c
# load "add_user_script"
# load "run_script_service"
# scr = RunScriptService.new("add_user")
# scr.set_connection
  end
end
