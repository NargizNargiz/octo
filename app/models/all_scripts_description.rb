class AllScriptsDescription < ApplicationRecord
	validates :name_script, presence: true, uniqueness: true
	validates :steps, presence: true
	# has_one :script_step
	# scriptstep указывает на AllScriptsDescription

end
