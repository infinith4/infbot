# Description:
#   Notification of the study meeting.

cronJob = require('cron').CronJob
module.exports = (robot) ->
  new cronJob('0,10,30,40 33-55 22 * * *', () =>
  envelope = room: process.env.HUBOT_CHATWORK_ROOMS
  robot.send envelope, "[To:1916058] \r\n12時になりました！"
).start()
