require "csv"
CSV.foreach("./app/data/airports.dat") do |row|
  name = row[1]
  code = row[4]
  lat = row[6]
  lon = row[7]
  puts "Saving #{name}"
  Airport.create! name: name, code: code, latitude: lat, longitude: lon
end

