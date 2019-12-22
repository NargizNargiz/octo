require 'rails_helper'

RSpec.describe "sttep_desttepions/edit.html.erb", type: :view do
 before(:each) do
    @sttep_desttepion = assign(:sttep_desttepion, ScriptDesttepion.create!(
      :step => "MyText",
      :rollbacks => 1,
      :checkbox => "Mytext",
      :limit => 1,
      :requests_to_admin => 1

    ))
  end

  # it "renders the edit sttep_desttepion form" do
  #   render

  #     assert_select "form[action=?][method=?]", sttep_desttepion_path(@sttep_desttepion), "post" do

  #     assert_select "input[name=?]", "sttep_desttepion[step]"

  #     assert_select "textarea[name=?]", "sttep_desttepion[rollbacks]"
  #   end
  # end
end
