class AddExecScriptIdToSteps < ActiveRecord::Migration[5.2]
  def change
  	add_column :steps, :exec_script_id, :integer
  end
end
