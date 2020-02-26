class AddExecScriptIdToScriptSteps < ActiveRecord::Migration[5.2]
  def change
  	   add_column :script_steps, :exec_script_id, :integer
  end
end
