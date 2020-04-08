require 'rails_helper'

RSpec.describe AllScriptsDescriptionsController, type: :controller do

  describe "GET #show" do
    it "returns http success" do
      get :show, params: {id: 1}
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  # describe "GET #create" do
  #   it "returns http success" do
  #     get :create, :params => {name_script: "Name_Script", steps: "steps" }
  #     expect(response).to have_http_status(:success)
  #   end
  # end

end
