require 'test_helper'

class EquipmentManagementsControllerTest < ActionController::TestCase
  setup do
    @equipment_management = equipment_managements(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:equipment_managements)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create equipment_management" do
    assert_difference('EquipmentManagement.count') do
      post :create, :equipment_management => @equipment_management.attributes
    end

    assert_redirected_to equipment_management_path(assigns(:equipment_management))
  end

  test "should show equipment_management" do
    get :show, :id => @equipment_management.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @equipment_management.to_param
    assert_response :success
  end

  test "should update equipment_management" do
    put :update, :id => @equipment_management.to_param, :equipment_management => @equipment_management.attributes
    assert_redirected_to equipment_management_path(assigns(:equipment_management))
  end

  test "should destroy equipment_management" do
    assert_difference('EquipmentManagement.count', -1) do
      delete :destroy, :id => @equipment_management.to_param
    end

    assert_redirected_to equipment_managements_path
  end
end
