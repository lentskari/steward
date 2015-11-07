class Geocode
  def self.address(address)
    Geokit::Geocoders::GoogleGeocoder.geocode address
  end

  def self.from_latlng(lat, lng)
    Geokit::Geocoders::GoogleGeocoder.reverse_geocode("#{lat},#{lng}")
  end
end
