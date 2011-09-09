require 'test_helper'

class CategoryTypesControllerTest < ActionController::TestCase
  setup do
    @category_type = category_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:category_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create category_type" do
    assert_difference('CategoryType.count') do
      post :create, :category_type => @category_type.attributes
    end

    assert_redirected_to category_type_path(assigns(:category_type))
  end

  test "should show category_type" do
    get :show, :id => @category_type.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @category_type.to_param
    assert_response :success
  end

  test "should update category_type" do
    put :update, :id => @category_type.to_param, :category_type => @category_type.attributes
    assert_redirected_to category_type_path(assigns(:category_type))
  end

  test "should destroy category_type" do
    assert_difference('CategoryType.count', -1) do
      delete :destroy, :id => @category_type.to_param
    end

    assert_redirected_to category_types_path
  end
end
