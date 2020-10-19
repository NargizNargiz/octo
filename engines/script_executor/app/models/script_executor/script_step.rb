module ScriptExecutor
	class ScriptStep < ApplicationRecord
		validates :script_name, presence: true
		has_many  :steps
		belongs_to :exec_script
		belongs_to :all_scripts_description
		accepts_nested_attributes_for :all_scripts_description, :exec_script
	end
end
