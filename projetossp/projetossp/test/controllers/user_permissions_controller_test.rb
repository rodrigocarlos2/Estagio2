require 'test_helper'

class UserPermissionsControllerTest < ActionController::TestCase
  setup do
    @user_permission = user_permissions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_permissions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_permission" do
    assert_difference('UserPermission.count') do
      post :create, user_permission: { permission_id: @user_permission.permission_id, segment_id: @user_permission.segment_id, user_id: @user_permission.user_id }
    end

    assert_redirected_to user_permission_path(assigns(:user_permission))
  end

  test "should show user_permission" do
    get :show, id: @user_permission
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user_permission
    assert_response :success
  end

  test "should update user_permission" do
    patch :update, id: @user_permission, user_permission: { permission_id: @user_permission.permission_id, segment_id: @user_permission.segment_id, user_id: @user_permission.user_id }
    assert_redirected_to user_permission_path(assigns(:user_permission))
  end

  test "should destroy user_permission" do
    assert_difference('UserPermission.count', -1) do
      delete :destroy, id: @user_permission
    end

    assert_redirected_to user_permissions_path
  end
end
