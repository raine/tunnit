require! 'ramda': {map}
require! zpad

module.exports = _ =
  parse-time-ranges: (str) ->
    str.match /\d\d:\d\d(-|–)\d\d:\d\d/g

  parse-time: (str) ->
    [ h, m ] = str.split ':'
    d = new Date!
    d.set-hours h
    d.set-minutes m
    d.set-seconds 0
    d.set-milliseconds 0
    d

  time-range-to-duration: (str) ->
    [start, end] = str.split /-|–/ |> map _.parse-time
    (end - start) / 1000 / 60

  duration-to-str: (min) ->
    h = min / 60
    m = ((h % 1) * 60).toFixed 0
    "#{Math.floor h}:#{zpad m}"
