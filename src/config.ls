require! {path, fs}

home = process.env.HOME
config-path = path.join home, \.config, \tunnit.js

safe-require = ->
  switch fs.exists-sync it
  | true      => require it
  | otherwise => {}

module.exports = safe-require config-path
