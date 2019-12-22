require "rails_helper"

RSpec.describe StepDescriptionsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/step_descriptions").to route_to("step_descriptions#index")
    end

    it "routes to #new" do
      expect(:get => "/step_descriptions/new").to route_to("step_descriptions#new")
    end

    it "routes to #show" do
      expect(:get => "/step_descriptions/1").to route_to("step_descriptions#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/step_descriptions/1/edit").to route_to("step_descriptions#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/step_descriptions").to route_to("step_descriptions#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/step_descriptions/1").to route_to("step_descriptions#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/step_descriptions/1").to route_to("step_descriptions#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/step_descriptions/1").to route_to("step_descriptions#destroy", :id => "1")
    end
  end
end
