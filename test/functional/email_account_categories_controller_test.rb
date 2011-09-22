require 'test_helper'

class EmailAccountCategoriesControllerTest < ActionController::TestCase
  setup do
    @email_account_category = email_account_categories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:email_account_categories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create email_account_category" do
    assert_difference('EmailAccountCategory.count') do
      post :create, :email_account_category => @email_account_category.attributes
    end

    assert_redirected_to email_account_category_path(assigns(:email_account_category))
  end

  test "should show email_account_category" do
    get :show, :id => @email_account_category.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @email_account_category.to_param
    assert_response :success
  end

  test "should update email_account_category" do
    put :update, :id => @email_account_category.to_param, :email_account_category => @email_account_category.attributes
    assert_redirected_to email_account_category_path(assigns(:email_account_category))
  end

  test "should destroy email_account_category" do
    assert_difference('EmailAccountCategory.count', -1) do
      delete :destroy, :id => @email_account_category.to_param
    end

    assert_redirected_to email_account_categories_path
  end
end
