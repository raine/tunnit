// This example demonstrates how to configure tunnit to parse arbitrary
// notation from each line and adjust the duration based on that.
//
// Here, `adjust` looks for strings such as "(+60min)" or "(-30min)" from
// each line, and adds or subtracts the minutes from duration that was parsed
// from the line's time range.
//
// `mapOutputLine` simply declutters the final output.
//
// $ echo "24.01.2014 08:30-17:00 (+30min)" | tunnit
// 24.01.2014 08:30-17:00 8:30
//
// $ echo "24.01.2014 08:30-17:00 (+60min)" | tunnit
// 24.01.2014 08:30-17:00 9:00


var LUNCH = 30;
var PARENS_RE = /\s?\(([+-]\d+)min*\)/;

module.exports = {
  // Example input:  510, "24.01.2014 08:30-17:00 (+60min)"
  // Example output: 510 - 30 + 60 => 540
  adjust: function(mins, line) {
    var time = (function() {
      var m;
      return (m = line.match(PARENS_RE))
              ? parseInt(m[1])
              : 0;
    })();

    return mins - LUNCH + time;
  },

  // Example input:  "24.01.2014 08:30-17:00 9:00 (+60min)"
  // Example output: "24.01.2014 08:30-17:00 9:00"
  mapOutputLine: function(line) {
    return line.replace(PARENS_RE, '');
  }
};
