class CreateScriptExecutorSteps < ActiveRecord::Migration[5.2]
  def change
    create_table :script_executor_steps do |t|
      t.string :name_step
      t.string :name_script
      t.string :status
      t.integer :rollbacks
      t.belongs_to :script
      t.belongs_to :exec_script
      t.timestamps
    end
  end
end
