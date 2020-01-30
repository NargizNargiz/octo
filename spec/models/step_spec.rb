require 'rails_helper'

RSpec.describe Step, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  context "validation tests" do
 	before :each do
 		@step = Step.new(name_step: "StepQWERTY", name_script: "QWERTY", status: "Finish", rollbacks: 0)
 	end
 	it "should be valid" do
 		expect(@step.valid?).to eq(true)
 	end
 	it "name_step should be present" do
 		@step.name_step = "     "
 		expect(@step.valid?).to eq(false)
 	end

 	it "name_script should be present" do
 		@step.name_script = "     "
 		expect(@step.valid?).to eq(false)
 	end
 	
 	it "rollbacks should be integer, negative example" do
 		@step.rollbacks = "dfg"
 		expect(@step.valid?).to eq(false)
 	end
	it "rollbacks should be integer, positive example" do
 		@step.rollbacks = 5
 		expect(@step.valid?).to eq(true)
 	end
 	
 	it "rollbacks should be greater or equal 0, positive example" do
 		@step.rollbacks = 5
 		expect(@step.valid?).to eq(true)
 	end
 	
 	it "rollbacks should be greater or equal 0, negative example" do
 		@step.rollbacks = -3
 		expect(@step.valid?).to eq(false)
 	end
 	it "status should be present" do
 		@step.status = "    "
 		expect(@step.valid?).to eq(false)
 	end
  end
end
