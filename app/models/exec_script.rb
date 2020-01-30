class ExecScript < ApplicationRecord
	validates :script_name, presence: true, uniqueness: true
	validates :rollbacks, numericality: {only_integer: true, greater_than_or_equal_to: 0} 
	validates :limit_errors, numericality: {only_integer: true, greater_than_or_equal_to: 0}
	validates :success, numericality: {only_integer: true, greater_than_or_equal_to: 0, less_than: 2}


end
