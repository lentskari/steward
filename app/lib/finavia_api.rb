class FinaviaAPI

  def get_profile(member_number)
    Rails.logger.info "MEMBER NUMBER #{member_number}"
    response = connection.get "/api/profile", {
      appId: ENV["FINAVIA_APPID"],
      membernumber: member_number,
      accessToken: ENV["FINAVIA_ACCESS_TOKEN"]
    }
    JSON.parse(response.body)
  end

  def get_booking_detail(pnr)
    response = connection.get "/api/getbookingdetails", {
      appId: ENV["FINAVIA_APPID"],
      pnr: pnr,
      accessToken: ENV["FINAVIA_ACCESS_TOKEN"]
    }
    JSON.parse(response.body)
  end

  def connection
    connection = Faraday.new "https://slush.ecom.finnair.com/"
    connection.basic_auth(ENV["FINAVIA_USERNAME"], ENV["FINAVIA_SECRET"])
    connection
  end
end
