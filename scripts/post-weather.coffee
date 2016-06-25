# Description:
#   use cron

cronJob = require('cron').CronJob
child_process = require 'child_process'

module.exports = (robot) ->
  new cronJob('0 0 7 * * *', () =>
    envelope = room: process.env.HUBOT_CHATWORK_ROOMS
    child_process.exec "ruby ./scripts/ext_scripts/post-weather.rb", (error, stdout, stderr) ->
      if !error
        output = ''+stdout+''  #Toを入れる
        robot.send envelope, output
      else
        robot.send envelope,"error"
  ).start()
