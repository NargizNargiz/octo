require 'rails_helper'

RSpec.describe "step_descriptions/new", type: :view do
  before(:each) do
    assign(:step_description, StepDescription.new(
      :script => "MyString",
      :steps => ["MyText"]
    ))
  end

  it "renders new step_description form" do
    render

    assert_select "form[action=?][method=?]", step_descriptions_path, "post" do

      assert_select "input[name=?]", "step_description[script]"

      assert_select "textarea[name=?]", "step_description[steps]"
    end
  end
end
