require 'main_spec_helper'

describe ScriptExecutor::StepsController, type: :controller do
  routes { ScriptExecutor::Engine.routes }
  context 'GET::all::steps' do
    let(:script_1) { create(:script, steps: steps[0, 2]) }
    let(:script_2) { create(:script, steps: steps[3, 5]) }
    let(:steps) { create_list(:step, 5) }

    it 'return steps of scripts' do
      script_1
      script_2
      get :all
      expect(JSON.parse(response.body).map { |step| step['id'] }).to match_array(steps.pluck(:id))
      expect(response).to be_successful
    end

    context 'steps of script' do
      let(:script) { create(:script, steps: steps) }
      it 'show steps of script' do
        script
        get :index, params: { script_id: script.id }
        expect(JSON.parse(response.body).map { |step| step['id'] }).to eq steps.pluck(:id)
        expect(response).to be_successful
      end

      it 'show one step of script' do
        script
        get :show, params: { script_id: script.id, id: steps.first.id }
        expect(JSON.parse(response.body)['id']).to eq steps.first.id
        expect(response).to be_successful
      end

      context 'update step' do
        let(:step) { create(:step) }
        let(:params) { { id: step.id, script_id: step.script_id, step: { status: 3, result: 'result', rollbacks: 3 } } }
        it 'updated attrs in step' do
          step
          put :update, params: params

          expect(JSON.parse(response.body)['status']).to eq 'success'
          expect(JSON.parse(response.body)['result']).to eq params[:step][:result]
          expect(JSON.parse(response.body)['rollbacks']).to eq params[:step][:rollbacks]
          expect(response).to be_successful
        end
      end

      context 'POST: step' do
        let(:step_attributes) { build(:step).attributes.select { |k, _| %w[name_step rollbacks status].include?(k)} }
        let(:params) { { step: step_attributes, script_id: script.id } }
        it 'created script\'s step ' do
          post :create, params: params

          expect(JSON.parse(response.body)['name_step']).to eq step_attributes['name_step']
          expect(JSON.parse(response.body)['script_id']).to eq script.id
          expect(response).to be_successful
        end
      end
    end
  end

  # describe 'post' do
  #   let(:description) { create(:description) }
  #   let(:params) { { step: { script_name: 'script', description_id: description.id } } }
  #   it 'check create' do
  #     get :create, params: params
  #     expect(ScriptExecutor::Step.count).to eq 1
  #     expect(JSON.parse(response.body)['description_id']).to eq description.id
  #     expect(response).to be_successful
  #   end
  # end
end