require! {
  '../lib/': { process-line }
}

input =
  """
  09.02.2015 11:00-18:00
  10.02.2015 09:15-17:45
  11.02.2015 09:30-17:45
  12.02.2015 09:15-19:45
  12.02.2015 09:45-18:00
  """

expected =
  """
  09.02.2015 11:00-18:00 7:00
  10.02.2015 09:15-17:45 8:30
  11.02.2015 09:30-17:45 8:15
  12.02.2015 09:15-19:45 10:30
  12.02.2015 09:45-18:00 8:15
  """

process-lines = map process-line
parse = process-lines . split \\n

describe 'tunnit' (,) ->
  it 'appends durations lines' ->
    eq expected, parse input
