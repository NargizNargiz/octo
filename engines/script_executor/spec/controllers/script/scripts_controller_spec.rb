require 'main_spec_helper'

describe ScriptExecutor::ScriptsController, type: :controller do
  routes { ScriptExecutor::Engine.routes }
  context 'GET::scripts' do
    let(:script) { create(:script) }
    it 'check index' do
      script
      get :index
      expect(JSON.parse(response.body).first['id']).to eq script.id
      expect(response).to be_successful
    end

    describe 'show' do
      let(:params) { { id: script.id } }
      it 'check show' do
        script
        get :show, params: params
        expect(JSON.parse(response.body)['id']).to eq script.id
        expect(response).to be_successful
      end
    end
  end

  describe 'post' do
    let(:description) { create(:description) }
    let(:params) { { script: { script_name: 'script', description_id: description.id } } }
    it 'check create' do
      get :create, params: params
      expect(ScriptExecutor::Step.count).to eq 1
      expect(JSON.parse(response.body)['description_id']).to eq description.id
      expect(response).to be_successful
    end
  end
end

