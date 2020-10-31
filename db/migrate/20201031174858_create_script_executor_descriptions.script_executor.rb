# This migration comes from script_executor (originally 20200120100356)
class CreateScriptExecutorDescriptions < ActiveRecord::Migration[5.2]
  def change
    create_table :script_executor_descriptions do |t|
      t.string :name_script
      t.text :steps
      t.timestamps
    end
  end
end
