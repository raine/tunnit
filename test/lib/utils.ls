map-each-line = ->
  (join \\n) . (map it) . (split \\n)

module.exports = { map-each-line }
