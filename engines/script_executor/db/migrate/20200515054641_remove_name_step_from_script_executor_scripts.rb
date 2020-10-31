class RemoveNameStepFromScriptExecutorScripts < ActiveRecord::Migration[5.2]
  def change
    remove_column :script_executor_scripts, :name_step, :string
  end
end
