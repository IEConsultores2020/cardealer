require "application_system_test_case"

class CarsTest < ApplicationSystemTestCase
  setup do
    sign_in users(:useradmin)
    @car = cars(:carone)
  end

  test "visiting the index" do
    visit cars_url
    assert_selector "h1", text: "Cars"
  end

  test "should create car" do
    visit cars_url
    click_on "New car"

    fill_in "Model", with: @car.model
    fill_in "Name", with: @car.name
    fill_in "Price", with: @car.price
    #fill_in "Category", with: @car.category
    select 'Used', from: 'Category'
    select "Dealership1", from: 'car_dealership_id'
    click_on "Create Car"

    assert_text "Car was successfully created"
    click_on "Back to cars"
  end


  test "should destroy Car" do
    visit car_url(@car)
    click_button  "Destroy this car", match: :first

    assert_text "Car was successfully destroyed"
  end
end