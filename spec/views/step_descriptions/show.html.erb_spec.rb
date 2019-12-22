require 'rails_helper'

RSpec.describe "step_descriptions/show", type: :view do
  before(:each) do
    @step_description = assign(:step_description, StepDescription.create!(
      :script => "Script",
      :steps => ["MyText"]
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Script/)
    expect(rendered).to match(/MyText/)
  end
end
