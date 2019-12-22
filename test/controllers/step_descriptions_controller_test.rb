require 'test_helper'

class StepDescriptionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @step_description = step_descriptions(:one)
  end

  test "should get index" do
    get step_descriptions_url
    assert_response :success
  end

  test "should get new" do
    get new_step_description_url
    assert_response :success
  end

  test "should create step_description" do
    assert_difference('StepDescription.count') do
      post step_descriptions_url, params: { step_description: { script: @step_description.script, steps: @step_description.steps } }
    end

    assert_redirected_to step_description_url(StepDescription.last)
  end

  test "should show step_description" do
    get step_description_url(@step_description)
    assert_response :success
  end

  test "should get edit" do
    get edit_step_description_url(@step_description)
    assert_response :success
  end

  test "should update step_description" do
    patch step_description_url(@step_description), params: { step_description: { script: @step_description.script, steps: @step_description.steps } }
    assert_redirected_to step_description_url(@step_description)
  end

  test "should destroy step_description" do
    assert_difference('StepDescription.count', -1) do
      delete step_description_url(@step_description)
    end

    assert_redirected_to step_descriptions_url
  end
end
