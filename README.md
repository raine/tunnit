# tunnit [![Build Status](https://travis-ci.org/raine/tunnit.svg?branch=master)](https://travis-ci.org/raine/tunnit) [![npm version](https://badge.fury.io/js/tunnit.svg)](https://www.npmjs.com/package/tunnit)

calculates number of hours for a text file

```sh
npm install -g tunnit
```

## intro

assuming `work.txt`

```
22.01.2014 09:30-16:45
23.01.2014 09:30-14:30
24.01.2014 08:30-17:00
```

```sh
$ tunnit < work.txt
22.01.2014 09:30-16:45 7:15
23.01.2014 09:30-14:30 5:00
24.01.2014 08:30-17:00 8:30
```

## customization

you can easily add custom rules and logic

#### `~/.config/tunnit.js`

```js
module.exports = {
  // :: adjust(mins: Number, line: String): Number
  adjust: function(mins, line) {
    // you can parse `line` here and adjust `mins` based on that.
    // subtract 30 minutes for each day because i had lunch
    return mins - 30;
  },

  // :: mapOutputLine(line: String): String
  mapOutputLine: function(line) {
    // make changes to line right before it is printed.
    // line contains duration at this point
    return line;
  }
};
```

see another, more involved [example config](https://github.com/raine/tunnit/blob/master/tunnit.example.js)
