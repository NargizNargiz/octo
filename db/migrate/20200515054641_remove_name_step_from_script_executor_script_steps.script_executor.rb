class RemoveNameStepFromScriptExecutorScriptSteps < ActiveRecord::Migration[4.2]
  def change
    remove_column :script_executor_script_steps, :name_step, :string
  end
end
