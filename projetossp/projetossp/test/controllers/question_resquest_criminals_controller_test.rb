require 'test_helper'

class QuestionResquestCriminalsControllerTest < ActionController::TestCase
  setup do
    @question_resquest_criminal = question_resquest_criminals(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:question_resquest_criminals)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create question_resquest_criminal" do
    assert_difference('QuestionResquestCriminal.count') do
      post :create, question_resquest_criminal: { question_id: @question_resquest_criminal.question_id, resquest_criminal_id: @question_resquest_criminal.resquest_criminal_id }
    end

    assert_redirected_to question_resquest_criminal_path(assigns(:question_resquest_criminal))
  end

  test "should show question_resquest_criminal" do
    get :show, id: @question_resquest_criminal
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @question_resquest_criminal
    assert_response :success
  end

  test "should update question_resquest_criminal" do
    patch :update, id: @question_resquest_criminal, question_resquest_criminal: { question_id: @question_resquest_criminal.question_id, resquest_criminal_id: @question_resquest_criminal.resquest_criminal_id }
    assert_redirected_to question_resquest_criminal_path(assigns(:question_resquest_criminal))
  end

  test "should destroy question_resquest_criminal" do
    assert_difference('QuestionResquestCriminal.count', -1) do
      delete :destroy, id: @question_resquest_criminal
    end

    assert_redirected_to question_resquest_criminals_path
  end
end
