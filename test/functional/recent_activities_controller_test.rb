require 'test_helper'

class RecentActivitiesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:recent_activities)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create recent_activity" do
    assert_difference('RecentActivity.count') do
      post :create, :recent_activity => { }
    end

    assert_redirected_to recent_activity_path(assigns(:recent_activity))
  end

  test "should show recent_activity" do
    get :show, :id => recent_activities(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => recent_activities(:one).to_param
    assert_response :success
  end

  test "should update recent_activity" do
    put :update, :id => recent_activities(:one).to_param, :recent_activity => { }
    assert_redirected_to recent_activity_path(assigns(:recent_activity))
  end

  test "should destroy recent_activity" do
    assert_difference('RecentActivity.count', -1) do
      delete :destroy, :id => recent_activities(:one).to_param
    end

    assert_redirected_to recent_activities_path
  end
end
