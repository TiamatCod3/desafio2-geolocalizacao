module GeolocationHelper
  #https://www.geeksforgeeks.org/program-distance-two-points-earth/#:~:text=For%20this%20divide%20the%20values,is%20the%20radius%20of%20Earth.
  class Geolocation
    def self.search_street(address)
      client = OpenStreetMap::Client.new
      response = client.search(q: address, format: 'json', addressdetails: '1')
      return response[0]['lat'].to_f, response[0]['long'].to_f
    
    end 

    def self.get_distance(pointA, pointB)
      lat1 = to_radian(pointA[0])
      long1 = to_radian(pointA[1])
      lat2 = to_radian(pointB[0])
      long2 = to_radian(pointB[1])

      dlong = long2 - long1
      dlat = lat2 - lat1

      a = Math.sin(dlat / 2)**2 + Math.cos(lat1) * Math.cos(lat2) * Math.sin(dlong / 2)**2
      c = 2 * Math.asin(Math.sqrt(a))
      r = 6371
      c * r

    end

    def self.to_radian(point)
      point / (180/Math::PI)
    end
  end

end