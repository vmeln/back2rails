require 'test_helper'

class OrdersControllerTest < ActionController::TestCase
  setup do
    @order = orders(:one)
  end

  test 'require items in cart'  do
    get :new
    assert_redirected_to store_path
  end

  test 'Should get new item' do
    item = LineItem.new
    item.build_cart
    item.product = products(:ruby)
    item.save!

    session[:cart_id] = item.cart_id
    get :new


    assert_response :success
  end

  test 'Should create order' do
    assert_difference('Order.count') do
      post :create, order: { address: @order.address, email: @order.email, name: @order.name, pay_type: @order.pay_type }
    end

    assert_redirected_to store_path
  end
end
