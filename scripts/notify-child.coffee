# Description:
#   use cron

cronJob = require('cron').CronJob
child_process = require 'child_process'

module.exports = (robot) ->
  new cronJob('0 0 9 * * *', () =>
    envelope = room: process.env.HUBOT_CHATWORK_ROOMS
    child_process.exec "ruby ext_scripts/get_hoge.rb", (error, stdout, stderr) ->
      if !error
        output = stdout+''
        robot.send envelope, output
      else
        robot.send envelope,"error"
  ).start()
