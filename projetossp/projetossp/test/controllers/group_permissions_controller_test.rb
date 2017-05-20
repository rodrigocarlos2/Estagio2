require 'test_helper'

class GroupPermissionsControllerTest < ActionController::TestCase
  setup do
    @group_permission = group_permissions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:group_permissions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create group_permission" do
    assert_difference('GroupPermission.count') do
      post :create, group_permission: { permission_id: @group_permission.permission_id, segment_id: @group_permission.segment_id, user_group_id: @group_permission.user_group_id }
    end

    assert_redirected_to group_permission_path(assigns(:group_permission))
  end

  test "should show group_permission" do
    get :show, id: @group_permission
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @group_permission
    assert_response :success
  end

  test "should update group_permission" do
    patch :update, id: @group_permission, group_permission: { permission_id: @group_permission.permission_id, segment_id: @group_permission.segment_id, user_group_id: @group_permission.user_group_id }
    assert_redirected_to group_permission_path(assigns(:group_permission))
  end

  test "should destroy group_permission" do
    assert_difference('GroupPermission.count', -1) do
      delete :destroy, id: @group_permission
    end

    assert_redirected_to group_permissions_path
  end
end
