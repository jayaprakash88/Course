require 'test_helper'

class CourceDetailsControllerTest < ActionController::TestCase
  setup do
    @cource_detail = cource_details(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cource_details)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cource_detail" do
    assert_difference('CourceDetail.count') do
      post :create, cource_detail: @cource_detail.attributes
    end

    assert_redirected_to cource_detail_path(assigns(:cource_detail))
  end

  test "should show cource_detail" do
    get :show, id: @cource_detail.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cource_detail.to_param
    assert_response :success
  end

  test "should update cource_detail" do
    put :update, id: @cource_detail.to_param, cource_detail: @cource_detail.attributes
    assert_redirected_to cource_detail_path(assigns(:cource_detail))
  end

  test "should destroy cource_detail" do
    assert_difference('CourceDetail.count', -1) do
      delete :destroy, id: @cource_detail.to_param
    end

    assert_redirected_to cource_details_path
  end
end
