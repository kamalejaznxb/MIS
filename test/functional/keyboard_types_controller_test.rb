require 'test_helper'

class KeyboardTypesControllerTest < ActionController::TestCase
  setup do
    @keyboard_type = keyboard_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:keyboard_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create keyboard_type" do
    assert_difference('KeyboardType.count') do
      post :create, :keyboard_type => @keyboard_type.attributes
    end

    assert_redirected_to keyboard_type_path(assigns(:keyboard_type))
  end

  test "should show keyboard_type" do
    get :show, :id => @keyboard_type.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @keyboard_type.to_param
    assert_response :success
  end

  test "should update keyboard_type" do
    put :update, :id => @keyboard_type.to_param, :keyboard_type => @keyboard_type.attributes
    assert_redirected_to keyboard_type_path(assigns(:keyboard_type))
  end

  test "should destroy keyboard_type" do
    assert_difference('KeyboardType.count', -1) do
      delete :destroy, :id => @keyboard_type.to_param
    end

    assert_redirected_to keyboard_types_path
  end
end
