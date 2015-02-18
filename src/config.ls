require! { path, fs }

home = process.env.HOME
config-path = path.join home, \.config, \tunnit, \config.js

default-config =
  handler: I

read-file-or-empty = ->
  switch fs.exists-sync it
  | true      => require it
  | otherwise => {}

config = merge default-config, read-file-or-empty config-path
module.exports = config
