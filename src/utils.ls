require! 'ramda': {map}
require! 'data.maybe': Maybe
require! zpad

module.exports = _ =
  parse-time-ranges: (str) ->
    Maybe.from-nullable <|
      str.match /\d\d:\d\d(-|–)\d\d:\d\d/g

  parse-time: (str) ->
    [ h, m ] = str.split ':'
    new Date!
      ..set-hours h
      ..set-minutes m
      ..set-seconds 0
      ..set-milliseconds 0

  time-range-to-duration: (str) ->
    [start, end] = str.split /-|–/ |> map _.parse-time
    (end - start) / 1000 / 60

  duration-to-str: (min) ->
    h = min / 60
    m = ((h % 1) * 60).to-fixed 0
    "#{Math.floor h}:#{zpad m}"
