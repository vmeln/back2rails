require 'test_helper'

class LineItemsControllerTest < ActionController::TestCase
  test 'Should create line item' do
    assert_difference('LineItem.count') do
      post :create, :product_id => products(:first).id
    end
  end

  test 'should create item in cart via AJAX' do
  	assert_difference('LineItem.count') do
  		xhr :post, :create, product_id: products(:ruby).id
  	end

  	assert_response :success
  	assert_select_jquery :html, '#cart' do
  		assert_select 'tr#current_item td', /Programming Ruby 1.9/
  	end
  end
end
