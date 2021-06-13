module ScriptExecutor
  module ApplicationHelper
    def script_executor_engine
      @@script_executor_engine_url_helpers ||= ScriptExecutor::Engine.routes.url_helpers
    end
  end
end
