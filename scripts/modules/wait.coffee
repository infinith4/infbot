module.exports =
  wait: (time) ->
    $.Deferred (defer) ->
        setTimeout ->
            defer.resolve()
        , time
