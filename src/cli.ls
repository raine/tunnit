require! 'ramda': {unary, flip, concat}
require! <[ split ./config ./prepend-hours ]>
require! 'through2-map': t-map

prepend     = flip concat
handle-line = unary (prepend '\n') . prepend-hours config

module.exports = (ui) ->
  ui.stdin
    .pipe split!
    .pipe t-map {+want-strings}, handle-line
    .pipe ui.stdout
