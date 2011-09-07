require 'test_helper'

class MouseTypesControllerTest < ActionController::TestCase
  setup do
    @mouse_type = mouse_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mouse_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mouse_type" do
    assert_difference('MouseType.count') do
      post :create, :mouse_type => @mouse_type.attributes
    end

    assert_redirected_to mouse_type_path(assigns(:mouse_type))
  end

  test "should show mouse_type" do
    get :show, :id => @mouse_type.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @mouse_type.to_param
    assert_response :success
  end

  test "should update mouse_type" do
    put :update, :id => @mouse_type.to_param, :mouse_type => @mouse_type.attributes
    assert_redirected_to mouse_type_path(assigns(:mouse_type))
  end

  test "should destroy mouse_type" do
    assert_difference('MouseType.count', -1) do
      delete :destroy, :id => @mouse_type.to_param
    end

    assert_redirected_to mouse_types_path
  end
end
