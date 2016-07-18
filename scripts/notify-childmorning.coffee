# Description:
#   use cron

cronJob = require('cron').CronJob
child_process = require 'child_process'

module.exports = (robot) ->
  new cronJob('0 0 8 * * 1-5', () =>
    roomIds = process.env.HUBOT_CHATWORK_ROOMS.split(",")
    for roomId, i in roomIds
      envelope = room: roomId
      child_process.exec "ruby ./scripts/ext_scripts/notify-child.rb", (error, stdout, stderr) ->
        if !error
          output = stdout+''
          robot.send envelope, output
        else
          robot.send envelope,"error"
  ).start()
