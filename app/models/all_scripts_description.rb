class AllScriptsDescription < ApplicationRecord
	validates :name_script, presence: true
	validates :steps, presence: true

end
