require 'test_helper'

class HarddiskTypesControllerTest < ActionController::TestCase
  setup do
    @harddisk_type = harddisk_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:harddisk_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create harddisk_type" do
    assert_difference('HarddiskType.count') do
      post :create, :harddisk_type => @harddisk_type.attributes
    end

    assert_redirected_to harddisk_type_path(assigns(:harddisk_type))
  end

  test "should show harddisk_type" do
    get :show, :id => @harddisk_type.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @harddisk_type.to_param
    assert_response :success
  end

  test "should update harddisk_type" do
    put :update, :id => @harddisk_type.to_param, :harddisk_type => @harddisk_type.attributes
    assert_redirected_to harddisk_type_path(assigns(:harddisk_type))
  end

  test "should destroy harddisk_type" do
    assert_difference('HarddiskType.count', -1) do
      delete :destroy, :id => @harddisk_type.to_param
    end

    assert_redirected_to harddisk_types_path
  end
end
