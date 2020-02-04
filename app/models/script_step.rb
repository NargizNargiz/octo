class ScriptStep < ApplicationRecord
	validates :script_name, presence: true
	validates :name_step, presence: true
	has_many :steps
	belongs_to :execScript
	belongs_to :allSciptDescription	# 
	has_many :steps
end
