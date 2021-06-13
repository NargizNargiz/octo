module ScriptExecutor
	class Description < ApplicationRecord
		JSON_SCHEMA = "#{Rails.root}/engines/script_executor/app/models/schemas/descriptions/step.json"

		validates :name_script, presence: true
		# validates :steps, presence: true, format: {with: /\A([A-Za-z ]+)(\1)*\Z/, message: "Введите шаги через пробел" }
		#regex snake case
		before_validation :processing_steps_attributes
		validates :steps, json: { message: ->(errors) { errors }, schema: JSON_SCHEMA }
		has_many :scripts
		# def steps
		# 	read_attribute(:steps).map {|v| Step.new(v) }
		# end

		# ActionController params will come across as:
		# {"0"=>{"name"=>"foo", "percentage"=>"10"}, "1"=>{"name"=>"bar", "percentage"=>"90"}}
		# def steps_attributes=(attributes)
		# 	binding.pry
		# 	new_steps = []
		# 	attributes.each do |index, attrs|
		# 		# next if '1' == attrs.delete("_destroy")
		# 		attrs[:name] = attrs[:name]
		# 		attrs[:order] = attrs[:order].try(:to_i)
		# 		attrs[:actions] = attrs[:actions].split(',') if attrs[:actions].present?
		# 		attrs[:previous_result_need] = attrs[:previous_result_need]
		# 		new_steps << attrs
		# 	end
		# 	new_steps = new_steps + self.steps
		# 	binding.pry
		# 	write_attribute(:steps, new_steps)
		# end

		# def step_attribute=(attribute)
		# 	new_steps = []
		# 	attribute[:actions] = attribute[:actions].split(',') if attribute[:actions].present?
		# 	new_steps << attribute
		# 	new_steps = new_steps + self.steps
		# 	write_attribute(:steps, new_steps)
		# end

		# def build_step
		# 	v = self.steps.dup
		# 	v << Step.new({name: '', order: 0, actions: [], previous_result_need: false})
		# 	self.steps = v
		# end


		# class Step
		# 	attr_accessor :name, :order, :actions, :previous_result_need
		#
		# 	def initialize(hash)
		# 		@name          = hash['name']
		# 		@order    = hash['order'].to_i
		# 		@actions = hash['actions']
		# 		@previous_result_need = hash['previous_result_need']
		# 	end
		# 	def persisted?() false; end
		# 	def new_record?() false; end
		# 	def marked_for_destruction?() false; end
		# 	def _destroy() false; end
		# end
		#
		def processing_steps_attributes
			return unless steps.present?

			steps.each do |step|
				step['order'] = step['order'].to_i
				step['previous_result_need'] = step['previous_result_need'] == 'true' ? true : false
			end
		end
	end
end