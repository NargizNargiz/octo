require "application_system_test_case"

class StepDescriptionsTest < ApplicationSystemTestCase
  setup do
    @step_description = step_descriptions(:one)
  end

  test "visiting the index" do
    visit step_descriptions_url
    assert_selector "h1", text: "Step Descriptions"
  end

  test "creating a Step description" do
    visit step_descriptions_url
    click_on "New Step Description"

    fill_in "Script", with: @step_description.script
    fill_in "Steps", with: @step_description.steps
    click_on "Create Step description"

    assert_text "Step description was successfully created"
    click_on "Back"
  end

  test "updating a Step description" do
    visit step_descriptions_url
    click_on "Edit", match: :first

    fill_in "Script", with: @step_description.script
    fill_in "Steps", with: @step_description.steps
    click_on "Update Step description"

    assert_text "Step description was successfully updated"
    click_on "Back"
  end

  test "destroying a Step description" do
    visit step_descriptions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Step description was successfully destroyed"
  end
end
