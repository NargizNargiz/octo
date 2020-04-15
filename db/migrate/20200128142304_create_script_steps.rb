class CreateScriptSteps < ActiveRecord::Migration[5.2]
  def change
    create_table :script_steps do |t|
      t.belongs_to :all_scripts_description
      t.belongs_to :exec_script

      t.string :script_name
      t.string :name_step
      

      t.timestamps
    end
  end
end