module ScriptExecutor
	class Description < ApplicationRecord
		validates :name_script, presence: true, uniqueness: true
		# validates :steps, presence: true, format: {with: /\A([A-Za-z ]+)(\1)*\Z/, message: "Введите шаги через пробел" }
		#regex snake case
		validates :steps, presence: true
		has_many :scripts
	end
end
