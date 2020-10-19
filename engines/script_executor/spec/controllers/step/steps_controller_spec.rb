require 'main_spec_helper'

describe ScriptExecutor::ScriptStepsController, type: :controller do
  routes { ScriptExecutor::Engine.routes }
  let(:step) { create(:step) }
  # subject { get ScriptExecutor::Engine.routes.url_helpers.steps_create_path }
  it 'check index' do
    create(:script_step)
    get :index
    expect(ScriptExecutor::ScriptStep.count).to eq 1
    expect(response.code).to eq '200'
    # expect(response).to be_succeessfull
  end

  describe ' post check create' do
    let(:all_scripts_description) { create(:all_scripts_description, steps: 'step week' ) }
    let(:exec_script) { create(:exec_script) }
    let(:params) { { exec_script_id: exec_script.id, script_name: 'script', all_scripts_description_id: all_scripts_description.id } }
    it ' ' do
      binding.pry

      get :create, params: params
      # expect(response).to be_successful
      expect(ScriptExecutor::Step.count).to eq 1
    end
  end
end