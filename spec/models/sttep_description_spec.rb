require 'rails_helper'

RSpec.describe SttepDescription, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
context "validation tests" do
  	it "ensures step is present" do
  		sttep = SttepDescription.new(step: "step 1")
  		expect(sttep.valid?).to eq(false)
  	end
  	 it "ensures rollbacks is present" do
  	 	sttep = SttepDescription.new(rollbacks: 1234)
  	 	expect(sttep.valid?).to eq(false)
  	 end
  	
  	 it "ensures checkbox is present" do
  	 	sttep = SttepDescription.new(checkbox: "yes")
  	 	expect(sttep.valid?).to eq(false)
  	 end

  	 it "ensures limit is present" do
  	 	sttep = SttepDescription.new(limit: 1234)
  	 	expect(sttep.valid?).to eq(false)
  	 end

  	 it "ensures requests_to_admin is present" do
  	 	sttep = SttepDescription.new(requests_to_admin: "yes")
  	 	expect(sttep.valid?).to eq(false)
  	 end

  	# it "should be able to save sttep description" do
  	# 	sttep = SttepDescription.new(script: "Test script", steps: ["Step1","Step2","Step3"])
  	# 	expect(sttep.save).to eq(true)
  	# end	
  
  	
  end

end
