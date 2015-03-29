require! 'ramda': {reduce, map}
require! <[ chalk ]>
require! './utils': {parse-time-ranges, parse-time, time-range-to-duration, duration-to-str}

format-line = (line, dur) -->
  "#line #{chalk.bold dur}"

module.exports = prepend-hours = (opts, line) -->
  parse-time-ranges line
  |> map map time-range-to-duration
  |> map reduce (+), 0
  |> map opts.handler _, line
  |> map duration-to-str
  |> map format-line line
  |> -> it.get-or-else line
