class CreateScriptExecutorExecScripts < ActiveRecord::Migration[5.2]
  def change
    create_table :script_executor_exec_scripts do |t|
      t.string :script_name
      t.boolean :success
      t.integer :limit_errors
      t.integer :rollbacks
      t.belongs_to :script
      t.timestamps
    end
  end
end
