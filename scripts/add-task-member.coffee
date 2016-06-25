# Description:
#   Say hello.

child_process = require 'child_process'
resultcnt = 0
module.exports = (robot) ->
  #robot.respond /add\stask|今日の予定は (.*)/i, (msg) ->
  robot.respond /add\s+task\s+(.*)|今日の予定は\s+(.*)/i, (msg) ->
    envelope = room: process.env.HUBOT_CHATWORK_ROOMS
    roomId = process.env.HUBOT_CHATWORK_ROOMS
    accountId = msg.message.user.id
    console.log msg.message.user.id
    console.log msg.match
    arraytasks = []
    if(msg.match[1] != undefined)
      arraytasks  = msg.match[1].split(",")
    else if(msg.match[2] != undefined)
      arraytasks  = msg.match[2].split(",")
    for item in arraytasks
      console.log item
      child_process.exec "ruby ./scripts/ext_scripts/post-task.rb #{roomId} #{accountId} #{item}", (error, stdout, stderr) ->
        if !error
          console.log stdout+''
          resultcnt += 1
        else
          console.log error
    if(resultcnt == arraytasks.length)
      msg.send "#{arraytasks.length}件のタスクを追加しました"
    else
      #robot.send envelope, "すみません。処理に失敗しました。"


  # robot.respond /今日の予定は(.*)/i, (msg) ->
  #   envelope = room: process.env.HUBOT_CHATWORK_ROOMS
  #   arraytasks  = msg.match[1].split(",")
  #   for item in arraytasks
  #     wait(2000).done => child_process.exec "ruby ./scripts/ext_scripts/post-task.rb #{item}", (error, stdout, stderr) ->
  #   msg.send "#{arraytasks.length}件のタスクを追加しました"
