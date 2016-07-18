# Description:
#   use cron

cronJob = require('cron').CronJob
child_process = require 'child_process'

module.exports = (robot) ->
  new cronJob('0 50 6 * * *', () =>
    roomIds = process.env.HUBOT_CHATWORK_ROOMS.split(",")
    err = ""
    output = ""
    child_process.exec "ruby ./scripts/ext_scripts/post-weather.rb", (error, stdout, stderr) ->
      output = stdout
      console.log(output)
      console.log(error)
      if(error != null)
        err = error
      for roomId, i in roomIds
        console.log(roomId)
        envelope = room: roomId
        if !err
          console.log(output)
          robot.send envelope, output
        else
          robot.send envelope,"error"
  ).start()
