require! {
  '../lib/process-line'
}

describe 'handler' (,) ->
  it 'can manipulate mins' ->
    handler = add 30
    line = '09.02.2015 00:00-00:30'
    eq "#line 1:00", process-line handler, line
