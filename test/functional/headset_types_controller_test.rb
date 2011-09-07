require 'test_helper'

class HeadsetTypesControllerTest < ActionController::TestCase
  setup do
    @headset_type = headset_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:headset_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create headset_type" do
    assert_difference('HeadsetType.count') do
      post :create, :headset_type => @headset_type.attributes
    end

    assert_redirected_to headset_type_path(assigns(:headset_type))
  end

  test "should show headset_type" do
    get :show, :id => @headset_type.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @headset_type.to_param
    assert_response :success
  end

  test "should update headset_type" do
    put :update, :id => @headset_type.to_param, :headset_type => @headset_type.attributes
    assert_redirected_to headset_type_path(assigns(:headset_type))
  end

  test "should destroy headset_type" do
    assert_difference('HeadsetType.count', -1) do
      delete :destroy, :id => @headset_type.to_param
    end

    assert_redirected_to headset_types_path
  end
end
