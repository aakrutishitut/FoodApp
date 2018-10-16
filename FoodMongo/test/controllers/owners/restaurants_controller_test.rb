require 'test_helper'

class Owners::RestaurantsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @owners_restaurant = owners_restaurants(:one)
  end

  test "should get index" do
    get owners_restaurants_url
    assert_response :success
  end

  test "should get new" do
    get new_owners_restaurant_url
    assert_response :success
  end

  test "should create owners_restaurant" do
    assert_difference('Owners::Restaurant.count') do
      post owners_restaurants_url, params: { owners_restaurant: {  } }
    end

    assert_redirected_to owners_restaurant_url(Owners::Restaurant.last)
  end

  test "should show owners_restaurant" do
    get owners_restaurant_url(@owners_restaurant)
    assert_response :success
  end

  test "should get edit" do
    get edit_owners_restaurant_url(@owners_restaurant)
    assert_response :success
  end

  test "should update owners_restaurant" do
    patch owners_restaurant_url(@owners_restaurant), params: { owners_restaurant: {  } }
    assert_redirected_to owners_restaurant_url(@owners_restaurant)
  end

  test "should destroy owners_restaurant" do
    assert_difference('Owners::Restaurant.count', -1) do
      delete owners_restaurant_url(@owners_restaurant)
    end

    assert_redirected_to owners_restaurants_url
  end
end
