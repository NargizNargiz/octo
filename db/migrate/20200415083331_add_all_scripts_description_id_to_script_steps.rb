class AddAllScriptsDescriptionIdToScriptSteps < ActiveRecord::Migration[5.2]
  def change
  	  	add_column :script_steps, :all_scripts_description_id, :integer
  end
  # def up
	# add_all_scripts_description_id :script_steps, :all_scripts_description, foreign_key: true
	# change_column :script_steps, :all_scripts_description_id, :integer, null: false
  # end
  # def down
	# remove_column :script_steps, :all_scripts_description_id
	# end
end
