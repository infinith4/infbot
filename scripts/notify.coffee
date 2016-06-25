# Description:
#   Notification of the study meeting.
json = require 'json-file'
config = json.read('./.config.json')

cronJob = require('cron').CronJob
module.exports = (robot) ->
  new cronJob('0 0,30 19 * * 1,2,4,5', () =>
    envelope = room: process.env.HUBOT_CHATWORK_ROOMS
    robot.send envelope, "[To:#{config.get('accountIds').tashiro}] \r\nそろそろ帰る時間です！"
  ).start()
