require 'rails_helper'

RSpec.describe ScriptStep, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  context "validation test" do
    before :each do
      @execScript = ExecScript.new(script_name: "QWERTY", success: 0, limit_errors: 10, rollbacks: 0)
      @scriptDesctiption = AllScriptsDescription.new(name_script: "QWERTY", steps: "s1,s2,s3,s4,s5")
      @script_step = ScriptStep.new(script_name: "QWERTY",name_step:"stepQwerty")
      @script_step.exec_script = @execScript
      @script_step.all_scripts_description = @scriptDesctiption
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
