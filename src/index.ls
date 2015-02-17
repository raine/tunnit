require! {
  split
  './process-line'
}

global <<< require 'ramda'

unless-empty = (fn) ->
  (x) -> unless is-empty x then fn x

process.stdin.pipe split!
  .on 'data' unless-empty console.log . process-line
