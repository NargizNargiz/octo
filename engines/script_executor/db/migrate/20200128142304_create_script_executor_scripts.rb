class CreateScriptExecutorScripts < ActiveRecord::Migration[5.2]
  def change
    create_table :script_executor_scripts do |t|
      # t.belongs_to :all_scripts_description
      t.string :script_name
      t.string :name_step
      t.timestamps
      t.belongs_to :description
    end
  end
end
