# Description:
#   Notification of the study meeting.

roomIds = process.env.HUBOT_CHATWORK_ROOMS.split(",")
cronJob = require('cron').CronJob
module.exports = (robot) ->
  new cronJob('0 40 17 * * 3', () =>
  #new cronJob('0,20,30,40 30-59 17-23 * * 1-5', () =>
    for roomId, i in roomIds
      envelope = room: roomId
      robot.send envelope, "今日は水曜日です。そろそろ帰る時間です！"
  ).start()
  new cronJob('0 0,40 19 * * 1,2,4,5', () =>
  #new cronJob('0,20,40 30-59 19-23 * * 1,2,4,5', () =>
    for roomId, i in roomIds
      envelope = room: roomId
      #robot.send envelope, "[To:#{config.get('accountIds').tashiro}] \r\nそろそろ帰る時間です！"
      robot.send envelope, "そろそろ帰る時間です！"
  ).start()
