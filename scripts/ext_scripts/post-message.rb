require 'faraday'
require './appconfig.rb'

ROOM_ID = AppConfig.rooms.tashiro
CHATWORK_TOKEN = AppConfig.apikey.chatwork

conn = Faraday::Connection.new(url: 'https://api.chatwork.com') do |builder|
  builder.use Faraday::Request::UrlEncoded
  builder.use Faraday::Response::Logger
  builder.use Faraday::Adapter::NetHttp
end

response = conn.post do |request|
  request.url "/v1/rooms/#{ROOM_ID}/messages"
  request.headers = {
    'X-ChatWorkToken' => CHATWORK_TOKEN
  }
  request.params[:body] = "Hello World!" # => ここに入れる文字が投稿される
end
