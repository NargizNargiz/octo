class Step < ApplicationRecord
	validates :name_step, presence: true
	validates :name_script, presence: true
	validates :status, presence: true, numericality: {only_integer: true}
	validates :rollbacks, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0} 
	belongs_to :script_step
end
