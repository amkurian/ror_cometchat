class CometChatService
  include HTTParty
  BASE_URI = 'https://api.cometchat.com/v1'.freeze

  def fetch_users
    response = HTTParty.get("#{BASE_URI}/users", headers: headers)
    response.dig('data')
      &.map { |user| {name: user['name'], id: user['uid']} }
  end

  private

  def headers
    {
      apikey: ENV['COMETCHAT_API_KEY'],
      appid: ENV['COMETCHAT_APP_ID']
    }
  end
end