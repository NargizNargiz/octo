require 'rails_helper'

RSpec.describe "StepDescriptions", type: :request do
  describe "GET /step_descriptions" do
    it "works! (now write some real specs)" do
      get step_descriptions_path
      expect(response).to have_http_status(200)
    end
  end
end
