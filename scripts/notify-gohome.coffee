# Description:
#   Notification of the study meeting.

cronJob = require('cron').CronJob
module.exports = (robot) ->
  new cronJob('0 30 17 * * 3', () =>
    roomIds = process.env.HUBOT_CHATWORK_ROOMS.split(",")
    for roomId, i in roomIds
      envelope = room: roomId
      robot.send envelope, "今日は水曜日です。そろそろ帰る時間です！"
  ).start()
module.exports = (robot) ->
  new cronJob('0 0,30 19 * * 1,2,4,5', () =>
    roomIds = process.env.HUBOT_CHATWORK_ROOMS.split(",")
    for roomId, i in roomIds
      envelope = room: roomId
      robot.send envelope, "[To:#{config.get('accountIds').tashiro}] \r\nそろそろ帰る時間です！"
  ).start()
