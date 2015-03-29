var LUNCH = 30;
var PARENS_RE = /\s?\(([+-]\d+)min*\)/;

module.exports = {
  adjust: function(mins, line) {
    var time = (function() {
      var m;
      return (m = line.match(PARENS_RE))
              ? parseInt(m[1])
              : 0;
    })();

    return mins - LUNCH + time;
  },

  mapOutputLine: function(line) {
    return line.replace(PARENS_RE, '');
  }
};
