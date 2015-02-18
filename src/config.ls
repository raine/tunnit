# TODO: handle non-existent config

require! path
home = process.env.HOME
config-file = path.join home, \.config, \tunnit, \config.js
module.exports = require config-file
