require 'test_helper'

class NetworkManagementsControllerTest < ActionController::TestCase
  setup do
    @network_management = network_managements(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:network_managements)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create network_management" do
    assert_difference('NetworkManagement.count') do
      post :create, :network_management => @network_management.attributes
    end

    assert_redirected_to network_management_path(assigns(:network_management))
  end

  test "should show network_management" do
    get :show, :id => @network_management.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @network_management.to_param
    assert_response :success
  end

  test "should update network_management" do
    put :update, :id => @network_management.to_param, :network_management => @network_management.attributes
    assert_redirected_to network_management_path(assigns(:network_management))
  end

  test "should destroy network_management" do
    assert_difference('NetworkManagement.count', -1) do
      delete :destroy, :id => @network_management.to_param
    end

    assert_redirected_to network_managements_path
  end
end
