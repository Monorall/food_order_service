require "test_helper"

class OrdersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get orders_new_url
    assert_response :success
  end

  test "should get create" do
    get orders_create_url
    assert_response :success
  end

  test "should get kitchen" do
    get orders_kitchen_url
    assert_response :success
  end
end
