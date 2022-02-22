# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

url = "http://dadosabertos.rio.rj.gov.br/apiTransporte/apresentacao/rest/index.cfm/estacoesBikeRio"

data = RestClient.get url

bike_points = JSON.parse(data)['DATA']

bike_points.each |point| do
  
end