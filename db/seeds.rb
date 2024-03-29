# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

url = "http://dadosabertos.rio.rj.gov.br/apiTransporte/apresentacao/rest/index.cfm/estacoesBikeRio"

data = RestClient.get url
#["BAIRRO","ESTACAO","CODIGO","ENDERECO","NUMERO","LATITUDE","LONGITUDE"]
bike_points = JSON.parse(data)['DATA']

bike_points.each do |point|
  bike_point = BikePoint.new
  bike_point.district = point[0].encode("UTF-8", "Windows-1252")
  bike_point.station = point[1].encode("UTF-8", "Windows-1252")
  bike_point.code = point[2].to_i
  bike_point.address = point[3].encode("UTF-8", "Windows-1252")
  bike_point.number = point[4].to_s.encode("UTF-8", "Windows-1252")
  bike_point.lat = point[5].to_f
  bike_point.long = point[6].to_f
  bike_point.save
end
