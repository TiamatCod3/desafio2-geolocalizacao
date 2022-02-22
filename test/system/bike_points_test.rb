require "application_system_test_case"

class BikePointsTest < ApplicationSystemTestCase
  setup do
    @bike_point = bike_points(:one)
  end

  test "visiting the index" do
    visit bike_points_url
    assert_selector "h1", text: "Bike points"
  end

  test "should create bike point" do
    visit bike_points_url
    click_on "New bike point"

    fill_in "Address", with: @bike_point.address
    fill_in "Code", with: @bike_point.code
    fill_in "District", with: @bike_point.district
    fill_in "Lat", with: @bike_point.lat
    fill_in "Long", with: @bike_point.long
    fill_in "Number", with: @bike_point.number
    fill_in "Station", with: @bike_point.station
    click_on "Create Bike point"

    assert_text "Bike point was successfully created"
    click_on "Back"
  end

  test "should update Bike point" do
    visit bike_point_url(@bike_point)
    click_on "Edit this bike point", match: :first

    fill_in "Address", with: @bike_point.address
    fill_in "Code", with: @bike_point.code
    fill_in "District", with: @bike_point.district
    fill_in "Lat", with: @bike_point.lat
    fill_in "Long", with: @bike_point.long
    fill_in "Number", with: @bike_point.number
    fill_in "Station", with: @bike_point.station
    click_on "Update Bike point"

    assert_text "Bike point was successfully updated"
    click_on "Back"
  end

  test "should destroy Bike point" do
    visit bike_point_url(@bike_point)
    click_on "Destroy this bike point", match: :first

    assert_text "Bike point was successfully destroyed"
  end
end
