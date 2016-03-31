require 'test_helper'

class ClimbsControllerTest < ActionController::TestCase
  setup do
    @climb = climbs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:climbs)
  end

  test "should create climb" do
    assert_difference('Climb.count') do
      post :create, climb: { datetime: @climb.datetime, flights: @climb.flights, user_id: @climb.user_id }
    end

    assert_response 201
  end

  test "should show climb" do
    get :show, id: @climb
    assert_response :success
  end

  test "should update climb" do
    put :update, id: @climb, climb: { datetime: @climb.datetime, flights: @climb.flights, user_id: @climb.user_id }
    assert_response 204
  end

  test "should destroy climb" do
    assert_difference('Climb.count', -1) do
      delete :destroy, id: @climb
    end

    assert_response 204
  end
end
