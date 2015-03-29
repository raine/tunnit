require! 'ramda': {reduce, map, merge, flip, identity}
require! <[ chalk ]>
require! './utils': {parse-time-ranges, parse-time, time-range-to-duration, duration-to-str}

format-line = (line, dur) -->
  "#line #{chalk.bold dur}"

defaults = flip merge

DEFAULT_OPTS =
  adjust          : identity
  map-output-line : identity

module.exports = prepend-hours = (opts, line) -->
  let opts = defaults opts, DEFAULT_OPTS
    parse-time-ranges line
    |> map map time-range-to-duration
    |> map reduce (+), 0
    |> map opts.adjust _, line
    |> map duration-to-str
    |> map format-line line
    |> -> it.get-or-else line
