require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in users(:useradmin)
    @user = users(:useruser)
  end

  test "should get index" do
    get users_url
    assert_response :success
  end

  test "should not get index if signed out" do
    sign_out users(:useradmin)
    get users_url
    assert_response :redirect
  end  

  test "should show user" do
    get user_url(@user)
    assert_response :success
  end

  test "should destroy user" do
    assert_difference("User.count", -1) do
      delete user_url(@user)
    end

    assert_redirected_to users_url
  end
end
