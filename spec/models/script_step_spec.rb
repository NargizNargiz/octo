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
 	  
  end
end
