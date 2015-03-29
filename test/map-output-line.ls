require! '../lib/prepend-hours'

describe \map-output-line (,) ->
  it 'can manipulate output lines' ->
    line = '09.02.2015 00:00-00:30'
    opts = map-output-line: always \FOO
    eq \FOO, prepend-hours opts, line

  it 'is called with line with duration' ->
    line = '09.02.2015 00:00-00:30'
    opts = map-output-line: ->
      eq "#line 0:30", it
      it

    prepend-hours opts, line
