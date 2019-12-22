require 'rails_helper'

RSpec.describe "step_descriptions/index", type: :view do
  before(:each) do
    assign(:step_descriptions, [
      StepDescription.create!(
        :script => "Script",
        :steps => ["MyText"]
      ),
      StepDescription.create!(
        :script => "Script",
        :steps => ["MyText"]
      )
    ])
  end

  # it "renders a list of step_descriptions" do
  #   render
  #   assert_select "tr>td", :text => "Script".to_s, :count => 2
  #   assert_select "tr>td", :text => ["MyText"].to_s, :count => 2
  # end
end
