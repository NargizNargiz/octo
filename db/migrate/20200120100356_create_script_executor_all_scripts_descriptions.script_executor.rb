class CreateScriptExecutorAllScriptsDescriptions < ActiveRecord::Migration[4.2]
  def change
    create_table :script_executor_all_scripts_descriptions do |t|
      t.string :name_script
      t.text :steps
      t.timestamps
    end
  end
end
