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

module.exports = (line) ->
  ranges = parse-time-ranges line
  return line unless ranges # Maybe?
  
  ranges
  |> map time-range-to-duration
  |> reduce (+), 0
  |> duration-to-str
  |> format-line line
