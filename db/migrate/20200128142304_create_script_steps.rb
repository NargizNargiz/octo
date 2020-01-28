class CreateScriptSteps < ActiveRecord::Migration[5.2]
  def change
    create_table :script_steps do |t|
      t.string :script_name
      t.string :name_step

      t.timestamps
    end
  end
end
