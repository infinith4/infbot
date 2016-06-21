# Description:
#   Notification of the study meeting.

cronJob = require('cron').CronJob
module.exports = (robot) ->
  new cronJob('0 30 19 * * 1-5', () =>
    envelope = room: process.env.HUBOT_CHATWORK_ROOMS
    robot.send envelope, "[To:1916058] \r\nそろそろ帰る時間です！"
  ).start()
module.exports = (robot) ->
  new cronJob('0 0 19 * * *', () =>
    envelope = room: process.env.HUBOT_CHATWORK_ROOMS
    robot.send envelope, "[To:1916058] \r\n19時になりました！"
  ).start()
