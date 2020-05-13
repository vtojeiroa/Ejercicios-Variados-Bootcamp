'use strict';

function RunLength(str) {
  let newStr = '';
  for (let i = 0; i < str.length; i++) {
    let count = 1;
    for (let j = i; j < str.length; j++) {
      if (str[i] != str[j + 1]) break;
      count++;
      i++;
    }
    newStr += count === 1 ? 1 + str[i] : count + str[i];
  }

  // code goes here
  return newStr;
}

// keep this function call here
console.log(RunLength('aaabbbbcccdeefffaab'));
