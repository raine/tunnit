require! {
  split
  './utils': {
    parse-time-ranges,
    parse-time
  }
}

require 'ramda' .installTo global

process-line = (line) ->
  console.log parse-time-ranges line

unless-empty = (fn) ->
  (x) -> unless is-empty x then fn(x)

process.stdin.pipe split!
  .on 'data' unless-empty process-line
