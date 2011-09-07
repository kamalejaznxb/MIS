require 'test_helper'

class MonitorTypesControllerTest < ActionController::TestCase
  setup do
    @monitor_type = monitor_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:monitor_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create monitor_type" do
    assert_difference('MonitorType.count') do
      post :create, :monitor_type => @monitor_type.attributes
    end

    assert_redirected_to monitor_type_path(assigns(:monitor_type))
  end

  test "should show monitor_type" do
    get :show, :id => @monitor_type.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @monitor_type.to_param
    assert_response :success
  end

  test "should update monitor_type" do
    put :update, :id => @monitor_type.to_param, :monitor_type => @monitor_type.attributes
    assert_redirected_to monitor_type_path(assigns(:monitor_type))
  end

  test "should destroy monitor_type" do
    assert_difference('MonitorType.count', -1) do
      delete :destroy, :id => @monitor_type.to_param
    end

    assert_redirected_to monitor_types_path
  end
end
