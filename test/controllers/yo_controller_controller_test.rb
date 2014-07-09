require 'test_helper'

class YoControllerControllerTest < ActionController::TestCase
  test "should get yo" do
    get :yo
    assert_response :success
  end

end
