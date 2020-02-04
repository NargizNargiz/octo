class AllScriptsDescription < ApplicationRecord
	validates :name_script, presence: true, uniqueness: true
	validates :steps, presence: true
	has_one :scriptStep
	# scriptstep указывает на AllScriptsDescription

end
