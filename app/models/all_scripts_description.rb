class AllScriptsDescription < ApplicationRecord
	validates :name_script, presence: true, uniqueness: true
	validates :steps, presence: true

end
