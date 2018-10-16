require "application_system_test_case"

class Owners::RestaurantsTest < ApplicationSystemTestCase
  setup do
    @owners_restaurant = owners_restaurants(:one)
  end

  test "visiting the index" do
    visit owners_restaurants_url
    assert_selector "h1", text: "Owners/Restaurants"
  end

  test "creating a Restaurant" do
    visit owners_restaurants_url
    click_on "New Owners/Restaurant"

    click_on "Create Restaurant"

    assert_text "Restaurant was successfully created"
    click_on "Back"
  end

  test "updating a Restaurant" do
    visit owners_restaurants_url
    click_on "Edit", match: :first

    click_on "Update Restaurant"

    assert_text "Restaurant was successfully updated"
    click_on "Back"
  end

  test "destroying a Restaurant" do
    visit owners_restaurants_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Restaurant was successfully destroyed"
  end
end
