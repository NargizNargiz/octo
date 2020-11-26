class AddResultToScriptExecutorSteps < ActiveRecord::Migration[5.2]
  def change
    add_column :script_executor_steps, :result, :jsonb
  end
end
