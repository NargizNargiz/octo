require 'rails_helper'

RSpec.describe AllScriptsDescription, type: :model do
 # pending "add some examples to (or delete) #{__FILE__}"
 
 context "validation tests" do
 	it "should be valid" do
 		script_description = AllScriptsDescription.new(name_script: "QWERTY", steps: "s1,s2,s3,s4,s5")
 		expect(script_description.valid?).to eq(true)
 	end
 end
end
