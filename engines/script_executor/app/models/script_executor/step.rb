module ScriptExecutor
	 class Step < ApplicationRecord
		 include AASM
		 enum status: %i[pending running failed success].freeze

		 validates :name_step, presence: true
 		 validates :name_script, presence: true 
 		 # validates :status, presence: true
 		 validates :rollbacks, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0} 
 		 belongs_to :exec_script 
 		 accepts_nested_attributes_for  :exec_script

		 aasm column: 'status', enum: true do
			 state :pending, initial: true
			 state :pending, :running, :failed, :success

			 event :run do
				 transitions from: %i[pending failed running], to: :running
			 end

			 event :finish do
				 transitions from: %i[running success], to: :success
			 end

			 event :fail do
				 transitions from: %i[pending running failed success], to: :failed
			 end

			 event :to_pending do
				 transitions from: %i[running failed success pending], to: :pending
			 end
		 end
	 end
end
