require 'test_helper'

class OrdersControllerTest < ActionController::TestCase
  test 'require items in cart'  do
    get :new
    assert_redirected_to store_path
  end
end
