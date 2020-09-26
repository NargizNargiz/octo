class AddExecScriptIdToScriptExecutorSteps < ActiveRecord::Migration[4.2]
  def change
  	add_column :script_executor_steps, :exec_script_id, :integer
  end
end
