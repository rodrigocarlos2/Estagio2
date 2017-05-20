require 'test_helper'

class ResquestCriminalsControllerTest < ActionController::TestCase
  setup do
    @resquest_criminal = resquest_criminals(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:resquest_criminals)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create resquest_criminal" do
    assert_difference('ResquestCriminal.count') do
      post :create, resquest_criminal: { district_resquest: @resquest_criminal.district_resquest, district_send: @resquest_criminal.district_send, person_id: @resquest_criminal.person_id, type: @resquest_criminal.type, user_id: @resquest_criminal.user_id }
    end

    assert_redirected_to resquest_criminal_path(assigns(:resquest_criminal))
  end

  test "should show resquest_criminal" do
    get :show, id: @resquest_criminal
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @resquest_criminal
    assert_response :success
  end

  test "should update resquest_criminal" do
    patch :update, id: @resquest_criminal, resquest_criminal: { district_resquest: @resquest_criminal.district_resquest, district_send: @resquest_criminal.district_send, person_id: @resquest_criminal.person_id, type: @resquest_criminal.type, user_id: @resquest_criminal.user_id }
    assert_redirected_to resquest_criminal_path(assigns(:resquest_criminal))
  end

  test "should destroy resquest_criminal" do
    assert_difference('ResquestCriminal.count', -1) do
      delete :destroy, id: @resquest_criminal
    end

    assert_redirected_to resquest_criminals_path
  end
end
