require 'test_helper'

class LearnControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get learn_new_url
    assert_response :success
  end

  test "should get show" do
    get learn_show_url
    assert_response :success
  end

end
