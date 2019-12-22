require 'rails_helper'

RSpec.describe StepDescription, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  context "validation tests" do
  	it "ensures script is present" do
  		step = StepDescription.new(script: "User authentication")
  		expect(step.valid?).to eq(false)
  	end
  	it "ensures steps is present" do
  	step = StepDescription.new(steps: ["Step1","Step2","Step3"])
  		expect(step.valid?).to eq(false)
  	end
  	
  	it "should be able to save script description" do
  		step = StepDescription.new(script: "Test script", steps: ["Step1","Step2","Step3"])
  		expect(step.save).to eq(true)
  	end	
  
  	
  end

end
 