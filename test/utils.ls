require! {
  '../src/utils': {
    parse-time-ranges
    parse-time
    time-range-to-duration
    duration-to-str
  }
}

describe 'parse-time-ranges' (,) ->
  it 'parses multiple time ranges' ->
    str = '09.02.2015 11:00-18:00 19:10-20:00'
    deep-eq [ '11:00-18:00', '19:10-20:00' ], parse-time-ranges str

describe 'parse-time' (,) ->
  it 'parses time string as date' ->
    date = parse-time '10:30'
    eq 10, date.get-hours!
    eq 30, date.get-minutes!

describe 'time-range-to-duration' (,) ->
  it 'converts a time range to a duration in minutes' ->
    eq 390, time-range-to-duration '11:30–18:00'
    eq 5, time-range-to-duration '00:00–00:05'

describe 'duration-to-str' (,) ->
  it 'formats duration to string' ->
    eq '0:30', duration-to-str 30
    eq '6:30', duration-to-str 390
    eq '1:15', duration-to-str 75

  it 'zero pads minutes' ->
    eq '0:05', duration-to-str 5
