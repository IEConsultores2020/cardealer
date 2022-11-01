require "test_helper"

class DealershipsControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in users(:useradmin)
    @dealership = dealerships(:dtwo)
  end

  test "should get index if signed in" do
    get dealerships_url
    assert_response :success
  end

  test "should not get index if sign out" do
    sign_out user(:useradmin)
    get dealerships_url
    assert_response :redirect
  end

  test "should get new if signed in" do
    get new_dealership_url
    assert_response :success
  end

  test "should not get new if signed out" do
    sign_out users(:useradmin)
    get new_dealership_url
    assert_response :redirect
  end  

  test "should create dealership" do
    assert_difference("Dealership.count") do
      post dealerships_url, params: { dealership: { name: @dealership.name } }
    end
    assert_redirected_to dealership_url(Dealership.last)
  end

  test "should show dealership" do
    get dealership_url(@dealership)
    assert_response :success
  end

  test "should get edit" do
    get edit_dealership_url(@dealership)
    assert_response :success
  end

  test "should update dealership" do
    patch dealership_url(@dealership), params: { dealership: { name: @dealership.name } }
    assert_redirected_to dealership_url(@dealership)
  end

  test "should destroy dealership" do
    assert_difference("Dealership.count", -1) do
      delete dealership_url(@dealership)
    end

    assert_redirected_to dealerships_url
  end
end
