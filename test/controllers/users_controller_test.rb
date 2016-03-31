require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end

  test "should create user" do
    assert_difference('User.count') do
      post :create, user: { email: @user.email, first_name: @user.first_name, homefloor: @user.homefloor, last_name: @user.last_name, password: 'secret', password_confirmation: 'secret' }
    end

    assert_response 201
  end

  test "should show user" do
    get :show, id: @user
    assert_response :success
  end

  test "should update user" do
    put :update, id: @user, user: { email: @user.email, first_name: @user.first_name, homefloor: @user.homefloor, last_name: @user.last_name, password: 'secret', password_confirmation: 'secret' }
    assert_response 204
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete :destroy, id: @user
    end

    assert_response 204
  end
end
