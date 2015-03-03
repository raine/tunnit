require! {
  split
  chalk
  './utils': {
    parse-time-ranges
    parse-time
    time-range-to-duration
    duration-to-str
  }
}

format-line = (line, dur) -->
  "#line #{chalk.bold dur}"

module.exports = (opts, line) -->
  ranges = parse-time-ranges line
  return line unless ranges # Maybe?
  
  ranges
  |> map time-range-to-duration
  |> reduce (+), 0
  |> opts.handler _, line
  |> duration-to-str
  |> format-line line
