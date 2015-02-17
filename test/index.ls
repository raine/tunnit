require! \../lib/process-line

process-lines = map process-line
parse = join(\\n) . process-lines . split \\n

describe 'tunnit' (,) ->
  it 'appends durations lines' ->
    eq do
      """
      09.02.2015 11:00-18:00 7:00
      10.02.2015 09:15-17:45 8:30
      """

      """
      09.02.2015 11:00-18:00
      10.02.2015 09:15-17:45
      """ |> parse

  it 'handles empty lines' ->
    eq do
      """
      09.02.2015 11:00-18:00 7:00

      10.02.2015 09:15-17:45 8:30
      """

      """
      09.02.2015 11:00-18:00

      10.02.2015 09:15-17:45
      """ |> parse
