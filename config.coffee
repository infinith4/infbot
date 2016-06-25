fs = require 'fs'

fs.readFile '.config.json','utf8',(err,text)->
  console.log JSON.parse text
  #console.log jsonobj.accountIds.infbot

# jQuery ->
#   $.get(".config.json", null, (data)=>
#     for obj in data
#       console.log obj
