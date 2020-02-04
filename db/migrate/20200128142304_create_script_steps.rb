class CreateScriptSteps < ActiveRecord::Migration[5.2]
  def change
    create_table :script_steps do |t|
      t.belongs_to :allScriptDescription
      t.belongs_to :execScript
      t.string :script_name
      t.string :name_step
      

      t.timestamps
    end
  end
end
