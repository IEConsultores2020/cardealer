require "test_helper"

class RolesControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in users(:useradmin)
    @role = roles(:roleuser)
  end

  test "should get index if signed in" do
    get roles_url
    assert_response :success
  end

  test "should not get index if signed out" do
    sign_out users(:useradmin)
    get roles_url
    assert_response :redirect
  end

  test "should get new if signed in" do
    get new_role_url
    assert_response :success
  end

  test "should create role if signed in" do
    assert_difference("Role.count") do
      post roles_url, params: { role: { name: @role.name } }
    end

    assert_redirected_to role_url(Role.last)
  end

  test "should create role if signed out" do
    sign_in users(:useradmin)
    assert_difference("Role.count") do
      post roles_url, params: { role: { name: @role.name } }
    end

    assert_redirected_to role_url(Role.last)
  end  

  test "should show role if signed in" do
    get role_url(@role)
    assert_response :success
  end

  test "should get edit if signed in" do
    get edit_role_url(@role)
    assert_response :success
  end

  test "should update role if signed in" do
    patch role_url(@role), params: { role: { name: @role.name } }
    assert_redirected_to role_url(@role)
  end

  test "should destroy role if signed in" do
    assert_difference("Role.count", -1) do
      delete role_url(@role)
    end

    assert_redirected_to roles_url
  end
end
