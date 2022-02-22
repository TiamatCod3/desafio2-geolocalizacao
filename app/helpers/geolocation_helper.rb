module GeolocationHelper
  #https://www.geeksforgeeks.org/program-distance-two-points-earth/#:~:text=For%20this%20divide%20the%20values,is%20the%20radius%20of%20Earth.
  class Geolocation
    def self.search_street(address)
      # debugger

      client = OpenStreetMap::Client.new
      response = client.search(q: address, format: 'json', addressdetails: '1')
      if response.empty?
        response
      else 
        [response[0]['lat'].to_f, response[0]['lon'].to_f]
      end
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

    def self.get_nearest_points(point, points)
      nearest = Array.new
      points.each do |array_point|
        array_point[:distance] = get_distance([to_radian(point[0]), to_radian(point[1])],
                          [to_radian(array_point[:lat]),to_radian(array_point[:long])])
      end
      points.sort_by{|point| [point.distance]}
    end
  end
end