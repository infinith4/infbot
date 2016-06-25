require 'faraday'
require './scripts/ext_scripts/appconfig.rb'
require 'date'

ROOM_ID = ARGV[0]
CHATWORK_TOKEN = AppConfig.apikey.chatwork

conn = Faraday::Connection.new(url: 'https://api.chatwork.com') do |builder|
  builder.use Faraday::Request::UrlEncoded
  builder.use Faraday::Response::Logger
  builder.use Faraday::Adapter::NetHttp
end

response = conn.post do |request|
  request.url "/v1/rooms/#{ROOM_ID}/tasks"
  request.headers = {
    'X-ChatWorkToken' => CHATWORK_TOKEN
  }
  request.params[:body] = ARGV[2]
  request.params[:limit] = Date.today.to_time.to_i
  request.params[:to_ids] = ARGV[1]
end
