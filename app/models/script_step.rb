class ScriptStep < ApplicationRecord
	validates :script_name, presence: true
	validates :name_step, presence: true
end
