# Description:
#   use cron

cronJob = require('cron').CronJob
child_process = require 'child_process'
json = require 'json-file'
config = json.read('./.config.json')

module.exports = (robot) ->
  new cronJob('0 0 1 * * *', () =>
    console.log config.get('rooms').tashiro
    envelope = room: config.get('rooms').tashiro
    child_process.exec "ruby ./scripts/ext_scripts/notify-child.rb", (error, stdout, stderr) ->
      if !error
        output = stdout+''
        robot.send envelope, output
      else
        robot.send envelope,"error"
  ).start()
