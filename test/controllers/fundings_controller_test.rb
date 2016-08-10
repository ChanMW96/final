require 'test_helper'

class FundingsControllerTest < ActionController::TestCase
  test "should get create" do
    get :create
    assert_response :success
  end

end
