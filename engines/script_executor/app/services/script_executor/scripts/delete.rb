module ScriptExecutor
  module ScriptSteps
    class Delete
      def initialize(params)
        @params = params
      end

      def call
        validate!
        ScriptExecutor::DropDataOnCluster.call(script.id, script.class)
        # ScriptExecutor::SaveLogs()
        script.destroy
      end

      def validate

      end

      private
      attr_reader :params

      def script
        @script = Script.find(params[:id])
      end
    end
  end
end