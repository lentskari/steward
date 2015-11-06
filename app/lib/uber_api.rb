class UberAPI
  def products(latitude, longitude)
    response = connection.get("products", latitude: latitude, longitude: longitude)
    JSON.parse(response.body)
  end

  private

  def connection
    connection ||= Faraday.new(url: "https://api.uber.com/v1/",
                           headers: {
                             Authorization: "Token #{ENV["UBER_SERVER_TOKEN"]}"
                           })
  end

end
