# Description:
#   use cron

# cronJob = require('cron').CronJob
# child_process = require 'child_process'
#
# module.exports = (robot) ->
#   new cronJob('0 0 22 * * 1-5', () =>
#     envelope = room: "52230684"
#     child_process.exec "ruby ./scripts/ext_scripts/post-task.rb task", (error, stdout, stderr) ->
#       if !error
#         #output = stdout+''
#         #robot.send envelope, output
#       else
#         robot.send envelope,"error"
#   ).start()
