class BikePoint < ApplicationRecord
  def self.search_address(address)
    point = GeolocationHelper::Geolocation.search_street(address)
    if point.nil?
      nil 
    else
      point 
    end
  end

  def self.get_nearest_points(point)
    points = BikePoint.all
    GeolocationHelper::Geolocation.get_nearest_points(point, points.to_a)
  end
end
