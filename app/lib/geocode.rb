class Geocode
  def self.address(address)
    Geokit::Geocoders::GoogleGeocoder.geocode address
  end
end
