class CreateSteps < ActiveRecord::Migration[5.2]
  def change
    create_table :steps do |t|
      t.string :name_step
      
      t.string :name_script
      t.string :status
      t.integer :rollbacks

      t.belongs_to :script_step
      t.timestamps
    end
  end
end
