require! {
  split
  './utils': {
    parse-time-ranges
    parse-time
    time-range-to-duration
    duration-to-str
  }
}

global <<< require 'ramda'

format-line = (line, dur) -->
  "#line #dur"

process-line = (line) ->
  parse-time-ranges line
  |> map time-range-to-duration
  |> reduce (+), 0
  |> duration-to-str
  |> format-line line

unless-empty = (fn) ->
  (x) -> unless is-empty x then fn x

process.stdin.pipe split!
  .on 'data' unless-empty console.log . process-line

module.exports = { process-line }
