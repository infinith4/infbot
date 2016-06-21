# Description:
#   Notification of the study meeting.

cronJob = require('cron').CronJob
module.exports = (robot) ->
  new cronJob('0 0,30 17 * * 3', () =>
    envelope = room: process.env.HUBOT_CHATWORK_ROOMS
    robot.send envelope, "今日は水曜日です。そろそろ帰る時間です！"
  ).start()
