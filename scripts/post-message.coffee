# Description:
#   use cron

cronJob = require('cron').CronJob
child_process = require 'child_process'

module.exports = (robot) ->
  new cronJob('0,20,50 10-55 9 * * 1-6', () =>
    envelope = room: "52230684"
    child_process.exec "ruby ./scripts/ext_scripts/post-message.rb"
  ).start()
