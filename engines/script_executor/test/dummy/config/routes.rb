Rails.application.routes.draw do
  mount ScriptExecutor::Engine => "/script_executor"
end
