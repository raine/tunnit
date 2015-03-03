global <<< require 'ramda'

require! {
  split
  './config'
  './process-line'
}

process.stdin.pipe split!
  .on 'data' console.log . process-line config, _
