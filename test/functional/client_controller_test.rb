require 'test_helper'

class ClientControllerTest < ActionController::TestCase
  test "should get upload" do
    get :upload
    assert_response :success
  end

  test "should get index" do
    get :index
    assert_response :success
  end

end
