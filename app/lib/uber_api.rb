class UberAPI
  def products(latitude, longitude)
    response = connection.get("products", latitude: latitude, longitude: longitude)
    JSON.parse(response.body)
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
    connection ||= Faraday.new(url: "https://api.uber.com/v1/",
                           headers: {
                             Authorization: "Token #{ENV["UBER_SERVER_TOKEN"]}"
                           })
  end
end
