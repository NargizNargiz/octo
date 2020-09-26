class CreateScriptExecutorExecScripts < ActiveRecord::Migration[4.2]
  def change
    create_table :script_executor_exec_scripts do |t|
      t.string :script_name
      t.integer :success
      t.integer :limit_errors
      t.integer :rollbacks
      
      # t.belongs_to :script_step
      t.timestamps
    end
  end
end
