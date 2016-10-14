require 'test_helper'

class OrderControllerTest < ActionDispatch::IntegrationTest
  test "should get update" do
    get order_update_url
    assert_response :success
  end

end
