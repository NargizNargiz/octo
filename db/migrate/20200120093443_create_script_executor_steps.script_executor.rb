class CreateScriptExecutorSteps < ActiveRecord::Migration[4.2]
  def change
    create_table :script_executor_steps do |t|
      t.string :name_step,  null: false
      t.string :name_script, default: 0, null: false
      t.integer :status,  null: false
      t.integer :rollbacks,  null: false

      t.belongs_to :script_step
      t.timestamps
    end
  end
end
