class ScriptStep < ApplicationRecord
	validates :script_name, presence: true
	validates :name_step, presence: true
	has_many  :steps
	belongs_to :exec_script
	belongs_to :all_scripts_description	# 
end
