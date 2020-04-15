require 'rails_helper'

RSpec.describe ScriptStepsController, type: :controller do
  # before(:all) do
      # create :exec_script, script_name: "123", rollbacks: 1, limit_errors: 2, success: 0
      # create :script_step, script_name: "qwer", name_step: "sdfsdf", exec_script: exec_script

      # create_list(:script_step, 5)
        # get 'script_step'
  # end

  describe "GET #new" do
    it "returns http success" do
      get 'new'
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #index" do
    it "returns http success" do
      get 'index'
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #create" do
    it "returns http success" do
      get :create, params: {script_name: "name_script", name_step: "name_step"}
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, params: {id: 1}
      expect(response).to have_http_status(:success)
    end
  end

end
