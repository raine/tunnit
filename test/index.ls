require! '../lib/prepend-hours'
require! './lib/utils': {map-each-line}

opts = handler: identity

parse = map-each-line prepend-hours opts

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

  it 'handles unparseable lines' ->
    eq do
      """
      LOL
      09.02.2015 11:00-18:00 7:00
      """

      """
      LOL
      09.02.2015 11:00-18:00
      """ |> parse
