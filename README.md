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

#### `~/.config/tunnit/config.js`

```js
module.exports = {
  // you can parse `line` here and adjust `mins` based on that
  adjust: function(mins, line) {
    // subtract 30 minutes for each day because i had lunch
    return mins - 30;
  }
};
```
