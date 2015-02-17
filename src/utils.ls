require! zpad

module.exports = _ =
  parse-time-ranges: (str) ->
    str.match /\d\d:\d\d(-|–)\d\d:\d\d/g

  parse-time: (str) ->
    [ h, m ] = str.split ':'
    d = new Date!
    d.setHours h
    d.setMinutes m
    d.setSeconds 0
    d.setMilliseconds 0
    d

  time-range-to-duration: (str) ->
    [start, end] = str.split /-|–/ |> map _.parse-time
    end - start

  duration-to-str: (ms) ->
    h = ms / 1000 / 60 / 60
    m = ((h % 1) * 60).toFixed 0
    "#{Math.floor h}:#{zpad m}"
