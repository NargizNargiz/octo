# This migration comes from script_executor (originally 20201119101444)
class AddResultToScriptExecutorSteps < ActiveRecord::Migration[5.2]
  def change
    add_column :script_executor_steps, :result, :jsonb
  end
end
