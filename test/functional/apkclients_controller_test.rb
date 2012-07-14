require 'test_helper'

class ApkclientsControllerTest < ActionController::TestCase
  setup do
    @apkclient = apkclients(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:apkclients)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create apkclient" do
    assert_difference('Apkclient.count') do
      post :create, apkclient: { update_items: @apkclient.update_items, version_code: @apkclient.version_code, version_number: @apkclient.version_number }
    end

    assert_redirected_to apkclient_path(assigns(:apkclient))
  end

  test "should show apkclient" do
    get :show, id: @apkclient
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @apkclient
    assert_response :success
  end

  test "should update apkclient" do
    put :update, id: @apkclient, apkclient: { update_items: @apkclient.update_items, version_code: @apkclient.version_code, version_number: @apkclient.version_number }
    assert_redirected_to apkclient_path(assigns(:apkclient))
  end

  test "should destroy apkclient" do
    assert_difference('Apkclient.count', -1) do
      delete :destroy, id: @apkclient
    end

    assert_redirected_to apkclients_path
  end
end
