class BikePoint < ApplicationRecord
  def self.search_address(address)
    point = GeolocationHelper::Geolocation.search_street(address)
    if point.nil?
      nil 
    else
      point 
    end
  end
end
