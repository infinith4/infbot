# Description:
#   Notification of the study meeting.
# require './scripts/clean_up_update_db.js'
cronJob = require('cron').CronJob
module.exports = (robot) ->
  new cronJob('0,20,40 * 12-14 * * *', () =>
    envelope = room: process.env.HUBOT_CHATWORK_ROOMS
    robot.send envelope, "今日は水曜日です。Clean Upの日です"
    mymod = require './modules/clean_up_update_db'
    wait = require './modules/wait'
    # var mymod = new Mymod();
    # console.log mymod.add(1,2)
    # mymod.add(1,2)
    #   .then (result)->
    #     console.log result
    #     robot.send envelope, "担当は#{result}"
    #   .catch (error)->
    #     console.log "error", error
    mymod.find()
      .then (result)->
        console.log result
        robot.send envelope, "担当は#{result}"
      .catch (error)->
        console.log "error", error
    mymod.update()
      .then (result)->
        console.log result
        robot.send envelope, "DB update#{result}"
      .catch (error)->
        console.log "error", error
  ).start()
