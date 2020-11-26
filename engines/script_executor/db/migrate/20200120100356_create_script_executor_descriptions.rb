class CreateScriptExecutorDescriptions < ActiveRecord::Migration[5.2]
  def change
    create_table :script_executor_descriptions do |t|
      t.string :name_script
      t.jsonb :steps, default: []
      t.timestamps
    end
  end
end
