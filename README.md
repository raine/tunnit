# tunnit [![Build Status](https://travis-ci.org/raine/tunnit.svg?branch=master)](https://travis-ci.org/raine/tunnit) [![npm version](https://badge.fury.io/js/tunnit.svg)](http://badge.fury.io/js/tunnit)
```sh
npm install -g tunnit
```

## intro

assuming `work.txt`

```
20.01.2014 10:00-17:30
21.01.2014 09:30-17:45
22.01.2014 09:30-16:45
23.01.2014 09:30-14:30
24.01.2014 08:30-17:00
```

```sh
$ tunnit < work.txt
20.01.2014 10:00-17:30 7:30
21.01.2014 09:30-17:45 8:15
22.01.2014 09:30-16:45 7:15
23.01.2014 09:30-14:30 5:00
24.01.2014 08:30-17:00 8:30
```

## customization

you can easily add custom rules and logic

#### `~/.config/tunnit/config.js`

```js
module.exports = {
  handler: function(mins, line) {
    // subtract 30 minutes for each day because i had lunch
    return mins - 30;
  }
};
```
