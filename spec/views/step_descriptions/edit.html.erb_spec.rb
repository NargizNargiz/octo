require 'rails_helper'

RSpec.describe "step_descriptions/edit", type: :view do
  before(:each) do
    @step_description = assign(:step_description, StepDescription.create!(
      :script => "MyString",
      :steps => ["MyText"]
    ))
  end

  it "renders the edit step_description form" do
    render

    assert_select "form[action=?][method=?]", step_description_path(@step_description), "post" do

      assert_select "input[name=?]", "step_description[script]"

      assert_select "textarea[name=?]", "step_description[steps]"
    end
  end
end
