require 'test_helper'

class ProcessorTypesControllerTest < ActionController::TestCase
  setup do
    @processor_type = processor_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:processor_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create processor_type" do
    assert_difference('ProcessorType.count') do
      post :create, :processor_type => @processor_type.attributes
    end

    assert_redirected_to processor_type_path(assigns(:processor_type))
  end

  test "should show processor_type" do
    get :show, :id => @processor_type.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @processor_type.to_param
    assert_response :success
  end

  test "should update processor_type" do
    put :update, :id => @processor_type.to_param, :processor_type => @processor_type.attributes
    assert_redirected_to processor_type_path(assigns(:processor_type))
  end

  test "should destroy processor_type" do
    assert_difference('ProcessorType.count', -1) do
      delete :destroy, :id => @processor_type.to_param
    end

    assert_redirected_to processor_types_path
  end
end
