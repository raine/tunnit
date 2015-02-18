require! { path, fs }

home = process.env.HOME
config-path = path.join home, \.config, \tunnit, \config.js

default-config =
  handler: I

safe-require = ->
  switch fs.exists-sync it
  | true      => require it
  | otherwise => {}

config = merge default-config, safe-require config-path
module.exports = config
