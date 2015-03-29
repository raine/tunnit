require! '../lib/prepend-hours'

describe \adjust (,) ->
  it 'can manipulate mins' ->
    opts = adjust: add 30
    line = '09.02.2015 00:00-00:30'
    eq "#line 1:00", prepend-hours opts, line

  it 'is called with duration and line' ->
    line = '09.02.2015 00:00-00:30'
    opts = adjust: (mins, l) ->
      eq 30, mins
      eq line, l
      it

    prepend-hours opts, line

  it 'is identity fn by default' ->
    line = '09.02.2015 00:00-00:30'
    eq "#line 0:30", prepend-hours {}, line
