module ScriptExecutor
  module Steps
    class Create
      def initialize(params, script, user)
        @params = params
        @user = user
        @script = script
      end

      def call
      end

    end
  end
end