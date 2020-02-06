require 'test_helper'

class Admin::ProductsControllerTest < ActionDispatch::IntegrationTest
  test "should get admin/orders" do
    get admin_products_admin/orders_url
    assert_response :success
  end

end
