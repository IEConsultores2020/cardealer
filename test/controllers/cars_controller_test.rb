require "test_helper"

class CarsControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in users(:useradmin)
    @car = cars(:cartwo)
  end

  test "should get index" do
    get cars_url
    assert_response :success
  end

  test "should get new if signed in" do
    get new_car_url
    assert_response :success
  end

  test "should no get new if signed out" do
    sign_out users(:useradmin)
    get new_car_url
    assert_response :redirect
  end


  test "should create car if signed in" do
    assert_difference("Car.count") do
      post cars_url, params: { car: { depreciation: model: @car.model, name: @car.name, price: @car.price, category: @car.category, dealership_id: @car.dealership_id, user_id: @car.user_id} }
    end
    assert_redirected_to car_url(Car.last)
  end

  test "should show car" do
    get car_url(@car)
    assert_response :success
  end

  test "should get edit if signed in" do
    get edit_car_url(@car)
    assert_response :success
  end

  test "should get edit if signed out" do
    sign_in users(:useradmin)
    get edit_car_url(@car)
    assert_response :success
  end  

  test "should update car if signed in" do
    patch car_url(@car), params: { car: { depreciation: model: @car.model, name: @car.name, price: @car.price, category: @car.category, user_id: current_user} }
    assert_redirected_to car_url(@car)
  end

  test "should update car if signed out" do
    sign_in users(:useradmin)
    patch car_url(@car), params: { car: { depreciation: model: @car.model, name: @car.name, price: @car.price, category: @car.category, user_id: current_user} }
    assert_redirected_to car_url(@car)
  end

  test "should destroy car if signed in" do
    assert_difference("Car.count", -1) do
      delete car_url(@car)
    end

    assert_redirected_to cars_url
  end

  test "should destroy car if signed out" do
    sign_in users(:useradmin)
    assert_difference("Car.count", -1) do
      delete car_url(@car)
    end

    assert_redirected_to cars_url
  end  
end
