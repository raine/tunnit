export map-each-line = ->
  (join \\n) . (map it) . (split \\n)
