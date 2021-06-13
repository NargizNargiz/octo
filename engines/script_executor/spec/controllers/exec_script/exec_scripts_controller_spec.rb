require 'main_spec_helper'

describe ScriptExecutor::ExecScriptsController, type: :controller do
  routes { ScriptExecutor::Engine.routes }
  context 'GET::exec_scripts' do
    let(:exec_script) { create(:exec_script) }

    it 'return list of exec_scripts' do
      exec_script
      get :index
      expect(JSON.parse(response.body).first['id']).to eq exec_script.id
      expect(response).to be_successful
    end

    describe 'show' do
      let(:params) { { id: exec_script.id } }
      it 'return exec_script' do
        exec_script
        get :show, params: params
        expect(JSON.parse(response.body)['id']).to eq exec_script.id
        expect(response).to be_successful
      end
    end

    describe 'UPDATE' do
      let(:params) { { id: exec_script.id, exec_script: { limit_errors: 3 } } }
      it 'return update' do
        exec_script
        put :update, params: params
        expect(exec_script.reload.limit_errors).to eq params[:exec_script][:limit_errors]
        expect(response).to be_successful
      end
    end
  end

  describe 'post' do
    let(:script) { create(:script, exec_script: nil) }
    let(:params) { { exec_script: { script_name: 'script', limit_errors: 3, script_id: script.id } } }
    it 'check create' do
      script
      get :create, params: params
      expect(ScriptExecutor::ExecScript.count).to eq 1
      expect(response).to be_successful
    end
  end
end