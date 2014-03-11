require 'test_helper'

class LineItemsControllerTest < ActionController::TestCase
  test 'Should create line item' do
    assert_difference('LineItem.count') do
      post :create, :product_id => products(:first).id
    end
  end
end
