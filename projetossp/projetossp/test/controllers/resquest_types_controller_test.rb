require 'test_helper'

class ResquestTypesControllerTest < ActionController::TestCase
  setup do
    @resquest_type = resquest_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:resquest_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create resquest_type" do
    assert_difference('ResquestType.count') do
      post :create, resquest_type: { description: @resquest_type.description, name: @resquest_type.name }
    end

    assert_redirected_to resquest_type_path(assigns(:resquest_type))
  end

  test "should show resquest_type" do
    get :show, id: @resquest_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @resquest_type
    assert_response :success
  end

  test "should update resquest_type" do
    patch :update, id: @resquest_type, resquest_type: { description: @resquest_type.description, name: @resquest_type.name }
    assert_redirected_to resquest_type_path(assigns(:resquest_type))
  end

  test "should destroy resquest_type" do
    assert_difference('ResquestType.count', -1) do
      delete :destroy, id: @resquest_type
    end

    assert_redirected_to resquest_types_path
  end
end
