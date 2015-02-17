require! {
  split
  './process-line'
}

global <<< require 'ramda'

process.stdin.pipe split!
  .on 'data' console.log . process-line
