require! 'ramda': {identity, merge}
require! {path, fs}

home = process.env.HOME
config-path = path.join home, \.config, \tunnit, \config.js

default-config =
  adjust: identity

safe-require = ->
  switch fs.exists-sync it
  | true      => require it
  | otherwise => {}

config = merge default-config, safe-require config-path
module.exports = config
