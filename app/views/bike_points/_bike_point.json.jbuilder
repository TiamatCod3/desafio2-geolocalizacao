json.extract! bike_point, :id, :district, :station, :code, :address, :number, :lat, :long, :created_at, :updated_at
json.url bike_point_url(bike_point, format: :json)
