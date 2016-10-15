# Description:
#   Say hello.

child_process = require 'child_process';
resultcnt = 0
cronJob = require('cron').CronJob;
moment = require('moment');
module.exports = (robot) ->
  # *(sec) *(min) *(hour) *(day) *(month) *(day of the week)
  new cronJob('0 0 10 * * *', () =>
    envelope = room: process.env.HUBOT_CHATWORK_ROOMS;
    roomIds = process.env.HUBOT_CHATWORK_ROOMS.split(",");
    today = moment();
    # formatを指定して出力
    #console.log m.format("YYYY年MM月DD日 ddd");
    #msg.send m.format("YYYY年MM月DD日 ddd");
    endofm = moment();
    endofm.endOf('month');
    #endofm7 = moment();
    #endofm.add('days', -5);
    #endofmonthbefore7 = m.add(-7, "days");
    #msg.send m.endOf('month').format("YYYY/MM/DD HH:mm:ss");
    endofmstr = endofm.format("YYYY/MM/DD HH:mm:ss");
    console.log endofmstr.toString();

    for roomId, i in roomIds
      envelope = room: roomId
      #roomId = process.env.HUBOT_CHATWORK_ROOMS
      # accountId = msg.message.user.id
      if(today.diff(endofm, 'days') >= -5)  #月末から5日前なら毎日Remindする
        robot.send envelope, 'remind';
        robot.send envelope, endofmstr.toString();
        console.log endofmstr.toString();
  ).start()
