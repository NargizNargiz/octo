module ScriptExecutor
  class Engine < ::Rails::Engine
    isolate_namespace ScriptExecutor
  end
end
