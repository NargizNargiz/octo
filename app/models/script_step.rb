class ScriptStep < ApplicationRecord
	validates :script_name, uniqueness: true, presence: true
	validates :name_step, uniqueness: true, presence: true
end
