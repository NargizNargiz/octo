require 'main_spec_helper'
describe ScriptExecutor::ScriptStepsController do
  let(:step) { create(:step) }
  # subject { get '/steps/create' }
  it 'check test' do
    create(:step)

    subject
    binding.pry
    expect(ScriptExecutor::Step.count).to eq 1
    # expect(response).to be_succeessfull
  end
end