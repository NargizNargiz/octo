class CreateAllScriptsDescriptions < ActiveRecord::Migration[5.2]
  def change
    create_table :all_scripts_descriptions do |t|
      t.string :name_script
      t.text :steps

      t.timestamps
    end
  end
end
