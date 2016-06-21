# Description:
#   Say hello.

module.exports = (robot) ->
  robot.hear /who are you/i, (msg) ->
    msg.send "I'm hubot!"

  robot.hear /HELLO$/i, (msg) ->
    msg.send "hello! world"

  robot.respond /who am I/i, (msg) ->
    msg.send "You are #{msg.message.user.name}"

  robot.respond /what is this (.*)/i, (msg) ->
    msg.send "This is #{msg.match[1]}"

  robot.hear /おはよう/i, (msg) ->
    msg.send "今日もよろしくお願いします"

  robot.hear /私は誰/i, (msg) ->
    msg.send "あなたは #{msg.message.user.name}"

  robot.hear /あなたは誰/i, (msg) ->
    msg.send "私はinfbot♡"
