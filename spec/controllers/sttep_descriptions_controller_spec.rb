require 'rails_helper'

RSpec.describe SttepDescriptionsController, type: :controller do
let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

   let(:valid_session) { {} }

  describe "GET #index" do
    it "returns http success" do
      get :index 
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show 
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      get :edit
      expect(response).to have_http_status(:success)
    end
  end

    describe "POST #create" do
    context "with valid params" do
      it "creates a new SttepDescription" do
        expect {
          post :create, params: {sttep_description: valid_attributes}, session: valid_session
        }.to change(SttepDescription, :count).by(1)
      end

      it "redirects to the created sttep_description" do
        post :create, params: {sttep_description: valid_attributes}, session: valid_session
        expect(response).to redirect_to(SttepDescription.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {sttep_description: invalid_attributes}, session: valid_session
        expect(response).to be_successful
      end
    end
  end
describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested sttep_description" do
        sttep_description = SttepDescription.create! valid_attributes
        put :update, params: {id: sttep_description.to_param, sttep_description: new_attributes}, session: valid_session
        sttep_description.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the sttep_description" do
        sttep_description = SttepDescription.create! valid_attributes
        put :update, params: {id: sttep_description.to_param, sttep_description: valid_attributes}, session: valid_session
        expect(response).to redirect_to(sttep_description)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        sttep_description = SttepDescription.create! valid_attributes
        put :update, params: {id: sttep_description.to_param, sttep_description: invalid_attributes}, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested sttep_description" do
      sttep_description = SttepDescription.create! valid_attributes
      expect {
        delete :destroy, params: {id: sttep_description.to_param}, session: valid_session
      }.to change(SttepDescription, :count).by(-1)
    end

    it "redirects to the sttep_descriptions list" do
      sttep_description = SttepDescription.create! valid_attributes
      delete :destroy, params: {id: sttep_description.to_param}, session: valid_session
      expect(response).to redirect_to(sttep_descriptions_url)
    end
  end


end
