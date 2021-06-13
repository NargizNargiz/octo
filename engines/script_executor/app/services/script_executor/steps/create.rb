module ScriptExecutor
  module Step
    class Create
      def initialize(params, script)
        @params = params
        @script = script
      end

      def call
        # // создаем у скрипта шаг
        script.steps.create(params)
      end
    end
  end
end