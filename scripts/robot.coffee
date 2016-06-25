Log = require 'log'
@logger = new Log process.env.HUBOT_LOG_LEVEL or 'info'
console.log @logger
