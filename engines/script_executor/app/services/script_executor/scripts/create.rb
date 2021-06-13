module ScriptExecutor
  module ScriptSteps
    class Create
      def initialize(params)
        @params = params
      end

      def call
        ScriptStep.create(params.permit(:all_scripts_description_id,:exec_script_id, :script_name))
      end

      private
      attr_reader :params
    end
  end
end