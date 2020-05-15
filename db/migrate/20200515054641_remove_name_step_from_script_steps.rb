class RemoveNameStepFromScriptSteps < ActiveRecord::Migration[5.2]
  def change
    remove_column :script_steps, :name_step, :string
  end
end
