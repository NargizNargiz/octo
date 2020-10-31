module ScriptExecutor
	class Script < ApplicationRecord
		validates :script_name, presence: true
		has_many  :steps
		has_one :exec_script
		belongs_to :description
		accepts_nested_attributes_for :description, :exec_script
	end
end
