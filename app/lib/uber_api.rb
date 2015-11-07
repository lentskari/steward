class NoUberAvailableError < StandardError
end

class UberAPI
  def products(latitude, longitude)
    response = connection.get("products", latitude: latitude, longitude: longitude)
    JSON.parse(response.body)["products"]
  end

  def request_ride(customer, locations)
    first_product = products(locations[:start_lat], locations[:start_lon]).first
    if first_product.nil?
      raise NoUberAvailableError
    end
    puts first_product["product_id"]
    response = sandbox_connection(customer).post("requests", {
      product_id: first_product["product_id"],
      start_latitude: locations[:start_lat],
      start_longitude: locations[:start_lon],
      end_latitude: locations[:end_lat],
      end_longitude: locations[:end_lon]
    }.to_json)
    puts response.body
  end

  def authenticate(authorization_code)
    login_connection = Faraday.new(url: "https://login.uber.com/")
    response = login_connection.post("oauth/v2/token", {
      client_secret: ENV["UBER_CLIENT_SECRET"],
      client_id: ENV["UBER_CLIENT_ID"],
      grant_type: "authorization_code",
      redirect_uri: "airplane://redirect",
      code: authorization_code
    })
    body = JSON.parse(response.body)
    {
      access_token: body["access_token"],
      refresh_token: body["refresh_token"],
      expires_at: Time.now + body["expires_in"].seconds
    }

  end

  private

  def connection
    @connection ||= Faraday.new(url: "https://api.uber.com/v1/",
                           headers: {
                             Authorization: "Token #{ENV["UBER_SERVER_TOKEN"]}"
                           })
  end

  def sandbox_connection(customer)
    @sanbox_connection ||= Faraday.new(url: "https://sandbox-api.uber.com/v1/",
      headers: {
        :Authorization => "Bearer #{customer.uber_access_token}",
        :"Content-Type" => "application/json",
        :Accept => "application/json"
      })
  end
end
