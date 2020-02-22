class AddExecScriptToScriptSteps < ActiveRecord::Migration[5.2]
  def change
    add_column :script_steps, :exec_script, :integer
  end
end
