class SttepDescription < ApplicationRecord
	validates_presence_of :rollbacks, :step, :checkbox
	validates :step, uniqueness: true

	# before_validation :update_steps
	# def update_steps
	# 	self.steps = self.steps.split(",").map(&:strip) if self.steps.is_a?(String)
	# end
 
end
