require 'test_helper'

class DashboardControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success
  end

  test "should get guerillart" do
    get :guerillart
    assert_response :success
  end

  test "should get profle" do
    get :profle
    assert_response :success
  end

  test "should get write" do
    get :write
    assert_response :success
  end

  test "should get write_complete" do
    get :write_complete
    assert_response :success
  end

  test "should get edit" do
    get :edit
    assert_response :success
  end

  test "should get edit_complete" do
    get :edit_complete
    assert_response :success
  end

  test "should get delete_complete" do
    get :delete_complete
    assert_response :success
  end

end
