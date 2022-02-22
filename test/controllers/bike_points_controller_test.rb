require "test_helper"

class BikePointsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bike_point = bike_points(:one)
  end

  test "should get index" do
    get bike_points_url
    assert_response :success
  end

  test "should get new" do
    get new_bike_point_url
    assert_response :success
  end

  test "should create bike_point" do
    assert_difference("BikePoint.count") do
      post bike_points_url, params: { bike_point: { address: @bike_point.address, code: @bike_point.code, district: @bike_point.district, lat: @bike_point.lat, long: @bike_point.long, number: @bike_point.number, station: @bike_point.station } }
    end

    assert_redirected_to bike_point_url(BikePoint.last)
  end

  test "should show bike_point" do
    get bike_point_url(@bike_point)
    assert_response :success
  end

  test "should get edit" do
    get edit_bike_point_url(@bike_point)
    assert_response :success
  end

  test "should update bike_point" do
    patch bike_point_url(@bike_point), params: { bike_point: { address: @bike_point.address, code: @bike_point.code, district: @bike_point.district, lat: @bike_point.lat, long: @bike_point.long, number: @bike_point.number, station: @bike_point.station } }
    assert_redirected_to bike_point_url(@bike_point)
  end

  test "should destroy bike_point" do
    assert_difference("BikePoint.count", -1) do
      delete bike_point_url(@bike_point)
    end

    assert_redirected_to bike_points_url
  end
end
