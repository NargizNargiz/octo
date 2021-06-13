# This migration comes from script_executor (originally 20200120093443)
class CreateScriptExecutorSteps < ActiveRecord::Migration[5.2]
  def change
    create_table :script_executor_steps do |t|
      t.string :name_step
      t.string :name_script
      t.integer :status
      t.integer :rollbacks
      t.belongs_to :script
      t.belongs_to :exec_script
      t.timestamps
    end
  end
end
