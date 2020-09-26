class CreateScriptExecutorSteps < ActiveRecord::Migration[4.2]
  def change
    create_table :script_executor_steps do |t|
      t.string :name_step
      t.string :name_script
      t.string :status
      t.integer :rollbacks

      t.belongs_to :script_step
      t.timestamps
    end
  end
end
