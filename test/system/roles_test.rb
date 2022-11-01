require "application_system_test_case"

class RolesTest < ApplicationSystemTestCase
  setup do
    @role = roles(:roleadmin)
  end

  test "visiting the index" do
    visit roles_url
    assert_selector "h1", text: "Roles"
  end

  test "should create role" do
    visit roles_url
    click_on "New role"

    fill_in "Name", with: @role.name
    click_on "Create Role"

    assert_text "Role was successfully created"
    click_on "Back"
  end

end
