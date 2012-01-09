require 'test_helper'

class ThumbsupsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:thumbsups)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create thumbsup" do
    assert_difference('Thumbsup.count') do
      post :create, :thumbsup => { }
    end

    assert_redirected_to thumbsup_path(assigns(:thumbsup))
  end

  test "should show thumbsup" do
    get :show, :id => thumbsups(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => thumbsups(:one).to_param
    assert_response :success
  end

  test "should update thumbsup" do
    put :update, :id => thumbsups(:one).to_param, :thumbsup => { }
    assert_redirected_to thumbsup_path(assigns(:thumbsup))
  end

  test "should destroy thumbsup" do
    assert_difference('Thumbsup.count', -1) do
      delete :destroy, :id => thumbsups(:one).to_param
    end

    assert_redirected_to thumbsups_path
  end
end
