require 'main_spec_helper'

describe ScriptExecutor::DescriptionsController, type: :controller do
  routes { ScriptExecutor::Engine.routes }
  let(:step) { create(:step) }
  let(:description) { create(:description) }

  it 'return list of descriptions' do
    description
    get :index
    expect(ScriptExecutor::Description.count).to eq 1
    expect(response).to be_successful
  end

  it 'show' do
    description
    get :show, params: { id: description.id }
    expect(JSON.parse(response.body)['id']).to eq description.id
    expect(response).to be_successful
  end

  describe 'post' do
    let(:description_attributes) { build(:description).attributes }
    it 'created description' do
      expect(ScriptExecutor::Description.count).to eq 0

      post :create, params: { description: description_attributes }

      expect(ScriptExecutor::Description.count).to eq 1
      expect(response).to be_successful
    end
  end

  describe 'update' do
    let(:new_name) { 'new_name' }
    let(:params) { { id: description.id, description: { name_script: new_name } } }
    it 'updated description\'s name_script params' do

      put :update, params: params
      expect(description.reload.name_script).to eq new_name
      expect(response).to be_successful
    end

    context 'steps params' do
      let(:step_params) { { name: 'new_name_step', order: 3, previous_result_need: true, actions: ['action'] } }
      let(:params) { { id: description.id, description: { steps: [step_params] } } }
      it 'updated step\'s name order' do
        put :update, params: params

        expect(description.reload.steps.first['name']).to eq step_params[:name]
        expect(description.reload.steps.first['order']).to eq step_params[:order]
        expect(description.reload.steps.first['previous_result_need']).to eq step_params[:previous_result_need]
        expect(response).to be_successful
      end
    end
  end
end
