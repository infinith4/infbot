# Description:
#   Say hello.

child_process = require 'child_process';
moment = require 'moment';
resultcnt = 0
module.exports = (robot) ->
  robot.hear /remind (.*)/i, (msg) ->
    #envelope = room: process.env.HUBOT_CHATWORK_ROOMS
    #roomId = process.env.HUBOT_CHATWORK_ROOMS
    # accountId = msg.message.user.id
    console.log msg.match[1];
    m = moment();
    # formatを指定して出力
    #console.log m.format("YYYY年MM月DD日 ddd");
    #msg.send m.format("YYYY年MM月DD日 ddd");
    endofm = moment();
    endofm.endOf('month');
    #endofm7 = moment();
    endofm.add('days', -5);
    #endofmonthbefore7 = m.add(-7, "days");
    msg.send m.endOf('month').format("YYYY/MM/DD HH:mm:ss");
    msg.send endofm.format("YYYY/MM/DD HH:mm:ss");
    #msg.send endofmonth.format("YYYY/MM/DD HH:mm:ss");
    #msg.send endofmonthbefore7.format("YYYY/MM/DD HH:mm:ss");
    # child_process.exec "ruby ./scripts/ext_scripts/youtube-download-mp3.rb #{msg.match[1]}", (error, stdout, stderr) ->
    #   if !error
    #     console.log stdout+''
    #     resultcnt += 1
    #   else
    #     console.log error
    # msg.send "Downloadしました"
