require 'test_helper'

class RamTypesControllerTest < ActionController::TestCase
  setup do
    @ram_type = ram_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ram_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ram_type" do
    assert_difference('RamType.count') do
      post :create, :ram_type => @ram_type.attributes
    end

    assert_redirected_to ram_type_path(assigns(:ram_type))
  end

  test "should show ram_type" do
    get :show, :id => @ram_type.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @ram_type.to_param
    assert_response :success
  end

  test "should update ram_type" do
    put :update, :id => @ram_type.to_param, :ram_type => @ram_type.attributes
    assert_redirected_to ram_type_path(assigns(:ram_type))
  end

  test "should destroy ram_type" do
    assert_difference('RamType.count', -1) do
      delete :destroy, :id => @ram_type.to_param
    end

    assert_redirected_to ram_types_path
  end
end
