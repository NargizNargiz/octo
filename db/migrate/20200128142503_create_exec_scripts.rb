class CreateExecScripts < ActiveRecord::Migration[5.2]
  def change
    create_table :exec_scripts do |t|
      t.string :script_name
      t.integer :success
      t.integer :limit_errors
      t.integer :rollbacks

      t.timestamps
    end
  end
end
