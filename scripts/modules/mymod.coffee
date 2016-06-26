module.exports =
    add: (v1, v2) ->
        result = v1 + v2
        console.log v1 + v2
        new Promise (resolve)->
          setTimeout ->
            console.log "v1: #{v1} complete"
            resolve "#{result}"
            , 200 + Math.random() * 100
