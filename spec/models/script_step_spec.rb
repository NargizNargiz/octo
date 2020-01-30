require 'rails_helper'

RSpec.describe ScriptStep, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  context "validation test" do
	before :each do
 		@script_step = ScriptStep.new(script_name: "QWERTY",name_step:"stepQwerty")
 	end
 	it "should be valid" do
 		expect(@script_step.valid?).to eq(true)

 	end
	it "script_name should be present" do
 		@script_step.script_name = "  "
 		expect(@script_step.valid?).to eq(false)
 	end

	it "name_step should be present" do
		@script_step.name_step = "     "
		expect(@script_step.valid?).to eq(false) 
 	end

  	it "script_name should be unique " do
  		duplicate_script_step = @script_step.dup
 		duplicate_script_step.script_name = @script_step.script_name.upcase
 		@script_step.save
 		expect(duplicate_script_step.valid?).to eq(false)
  	end
  
 	it "name_step should be unique " do
  		duplicate_script_step = @script_step.dup
 		duplicate_script_step.name_step = @script_step.name_step.upcase
 		@script_step.save
 		expect(duplicate_script_step.valid?).to eq(false)
  	end

  end
end
