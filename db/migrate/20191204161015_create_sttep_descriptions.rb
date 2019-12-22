class CreateSttepDescriptions < ActiveRecord::Migration[5.2]
  def change
    create_table :sttep_descriptions do |t|
      t.string :step
      t.integer :rollbacks
      t.string :checkbox
      t.integer :limit
      t.integer :requests_to_admin

      t.timestamps
    end
  end
end
