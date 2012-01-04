require 'test_helper'

class ThumbsdownsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:thumbsdowns)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create thumbsdown" do
    assert_difference('Thumbsdown.count') do
      post :create, :thumbsdown => { }
    end

    assert_redirected_to thumbsdown_path(assigns(:thumbsdown))
  end

  test "should show thumbsdown" do
    get :show, :id => thumbsdowns(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => thumbsdowns(:one).to_param
    assert_response :success
  end

  test "should update thumbsdown" do
    put :update, :id => thumbsdowns(:one).to_param, :thumbsdown => { }
    assert_redirected_to thumbsdown_path(assigns(:thumbsdown))
  end

  test "should destroy thumbsdown" do
    assert_difference('Thumbsdown.count', -1) do
      delete :destroy, :id => thumbsdowns(:one).to_param
    end

    assert_redirected_to thumbsdowns_path
  end
end
