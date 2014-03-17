require 'test_helper'

class StoreControllerTest < ActionController::TestCase
  test 'should get index' do
    get :index
    assert_response :success
  end


  test 'markup needed for store.js.coffee is in place' do
  	get :index
  	assert_select 'div div.row > img', 3
  	assert_select '.row input[type=submit]', 3
  end
end
