require "test_helper"

class ScheduleEventsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get schedule_events_index_url
    assert_response :success
  end

  test "should get show" do
    get schedule_events_show_url
    assert_response :success
  end

  test "should get new" do
    get schedule_events_new_url
    assert_response :success
  end

  test "should get edit" do
    get schedule_events_edit_url
    assert_response :success
  end
end
