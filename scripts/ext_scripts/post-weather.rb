# -*- coding: utf-8 -*-
require 'net/http'
require 'json'

# 東京都 東京 の天気を取得、他の地域の場合はパラメータcityの値を変える
uri = URI('http://weather.livedoor.com/forecast/webservice/json/v1?city=130010')
weather_data = JSON.parse(Net::HTTP.get(uri))

weather_data['forecasts'].each {|forecast|
  if(forecast['dateLabel'] == "今日" || forecast['dateLabel'] == "明日") then
    forecast_message = "#{forecast['dateLabel']}の天気は#{forecast['telop']}です。(予報日：#{forecast['date']})"
    if(forecast['telop'].include?("雨")) then
      forecast_message += "傘を持って行きましょう！"
    end
    if(forecast['temperature']['max'] != nil) then
      forecast_message += "最高気温は#{forecast['temperature']['max']['celsius']}度、"
    end
    if(forecast['temperature']['min']) then
      forecast_message += "最低気温は#{forecast['temperature']['min']['celsius']}度です。"
    end
    p forecast_message
  end
}
