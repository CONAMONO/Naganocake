require 'test_helper'

class Admin::UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get products" do
    get admin_users_products_url
    assert_response :success
  end

end
