class StepDescription < ApplicationRecord
	# serialize :steps, Array
	validates_presence_of :script, :steps 
	validates :script, uniqueness: true

	before_validation :update_steps
	def update_steps
		self.steps = self.steps.split(",").map(&:strip) if self.steps.is_a?(String)
	end
end
