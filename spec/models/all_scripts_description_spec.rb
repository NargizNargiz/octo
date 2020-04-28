require 'rails_helper'

RSpec.describe AllScriptsDescription, type: :model do
 # pending "add some examples to (or delete) #{__FILE__}"
 
 context "validation tests" do
 	before :each do
 		@script_description = AllScriptsDescription.new(name_script: "QWERTY", steps: "ss sff srrr svvv sgfgf")
 		# @script_description = AllScriptsDescription.new()
 		# @script_description.name_script = "qwe"
 		@script_description.steps = "sss ff dsd sdds dffs"
 	end

 	it "should be valid" do
 		expect(@script_description.valid?).to eq(true)
 	end
 	it "name_script should be present" do
 		@script_description.name_script = "     "
 		expect(@script_description.valid?).to eq(false)
 	end
 	it "steps shold be present" do
 		@script_description.steps = "     "
 		expect(@script_description.valid?).to eq(false)
 	end
 	
 	it "name_script should be unique" do
 		duplicate_script = @script_description.dup
 		duplicate_script.name_script = @script_description.name_script.upcase
 		@script_description.save
 		expect(duplicate_script.valid?).to eq(false)
 	end
 end
end
