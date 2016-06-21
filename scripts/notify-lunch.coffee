# Description:
#   Notification of the study meeting.

cronJob = require('cron').CronJob
module.exports = (robot) ->
  new cronJob('0 0 12 * * *', () =>
    envelope = room: process.env.HUBOT_CHATWORK_ROOMS
    robot.send envelope, "12時になりました！Lunch食べましょう！"
  ).start()
