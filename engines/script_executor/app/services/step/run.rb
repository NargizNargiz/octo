module ScriptExecutor
  module Steps
    class Run
      def initialize(step, user)
        @build = step
        @user = user
      end

      def call
      end
    end
  end
end