require 'test_helper'

class ImageReportsControllerTest < ActionController::TestCase
  setup do
    @image_report = image_reports(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:image_reports)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create image_report" do
    assert_difference('ImageReport.count') do
      post :create, image_report: { description: @image_report.description }
    end

    assert_redirected_to image_report_path(assigns(:image_report))
  end

  test "should show image_report" do
    get :show, id: @image_report
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @image_report
    assert_response :success
  end

  test "should update image_report" do
    patch :update, id: @image_report, image_report: { description: @image_report.description }
    assert_redirected_to image_report_path(assigns(:image_report))
  end

  test "should destroy image_report" do
    assert_difference('ImageReport.count', -1) do
      delete :destroy, id: @image_report
    end

    assert_redirected_to image_reports_path
  end
end
