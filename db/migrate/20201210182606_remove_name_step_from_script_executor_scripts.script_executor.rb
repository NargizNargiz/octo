# This migration comes from script_executor (originally 20200515054641)
class RemoveNameStepFromScriptExecutorScripts < ActiveRecord::Migration[5.2]
  def change
    remove_column :script_executor_scripts, :name_step, :string
  end
end
