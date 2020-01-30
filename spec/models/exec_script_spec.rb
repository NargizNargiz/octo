require 'rails_helper'

RSpec.describe ExecScript, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
 context "validation tests" do
 	before :each do
 		@exec_script = ExecScript.new(script_name: "QWERTY", success: 0, limit_errors: 10, rollbacks: 0)
 	end
 	it "should be valid" do
 		expect(@exec_script.valid?).to eq(true)
 	end
 	it "script_name should be present" do
 		@exec_script.script_name = "     "
 		expect(@exec_script.valid?).to eq(false)
 	end
 	it "rollbacks should be integer, negative example" do
 		@exec_script.rollbacks = "dfg"
 		expect(@exec_script.valid?).to eq(false)
 	end
 	it "rollbacks should be integer, positive example" do
 		@exec_script.rollbacks = 5
 		expect(@exec_script.valid?).to eq(true)
 	end
 	it "rollbacks should be greater or equal 0, positive example" do
 		@exec_script.rollbacks = 5
 		expect(@exec_script.valid?).to eq(true)
 	end
 	
 	it "rollbacks should be greater or equal 0, negative example" do
 		@exec_script.rollbacks = -3
 		expect(@exec_script.valid?).to eq(false)
 	end
 	
 	it "script_name should be unique" do
 		duplicate_script = @exec_script.dup
 		duplicate_script.script_name = @exec_script.script_name.upcase
 		@exec_script.save
 		expect(duplicate_script.valid?).to eq(false)
 	end

 	it "limit_errors should be integer, negative example" do
 		@exec_script.limit_errors = "dfg"
 		expect(@exec_script.valid?).to eq(false)
 	end
 	
 	it "limit_errors should be integer, positive example" do
 		@exec_script.limit_errors = 5
 		expect(@exec_script.valid?).to eq(true)
 	end


 	it "success should be integer, negative example" do
 		@exec_script.success = "dfg"
 		expect(@exec_script.valid?).to eq(false)
 	end

 	it "success should be integer, positive example" do
 		@exec_script.success = 0
 		expect(@exec_script.valid?).to eq(true)
 	end

 	it "success should be equal 1 or 0" do
 		@exec_script.success = 2 		
 		expect(@exec_script.valid?).to eq(false)
 	end


 end
end
