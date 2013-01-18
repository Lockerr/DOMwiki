require 'test_helper'

class CsisControllerTest < ActionController::TestCase
  setup do
    @csi = csis(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:csis)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create csi" do
    assert_difference('Csi.count') do
      post :create, csi: {  }
    end

    assert_redirected_to csi_path(assigns(:csi))
  end

  test "should show csi" do
    get :show, id: @csi
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @csi
    assert_response :success
  end

  test "should update csi" do
    put :update, id: @csi, csi: {  }
    assert_redirected_to csi_path(assigns(:csi))
  end

  test "should destroy csi" do
    assert_difference('Csi.count', -1) do
      delete :destroy, id: @csi
    end

    assert_redirected_to csis_path
  end
end
