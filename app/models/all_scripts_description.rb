class AllScriptsDescription < ApplicationRecord
	validates :name_script, presence: true, uniqueness: true
	# validates :name_script, presence: true	
	validates :steps, presence: true, format: {with: /\A([A-Za-z ]+)(\1)*\Z/, message: "Введите шаги через пробел" }

end
