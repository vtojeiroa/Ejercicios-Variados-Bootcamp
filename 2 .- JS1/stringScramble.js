'use strict';

function StringScramble(str1, str2) {
  let output = '';
  for (let i = 0; i < str2.length; i++) {
    let pattern = new RegExp(str2[i]);
    if (str1.match(pattern) && str1.match(pattern)[0]) {
      output += str1.match(pattern)[0];
      str1 = str1.replace(str1.match(pattern)[0], '');
    }
  }
  // code goes here
  return output === str2 ? true : false;
}

// keep this function call here
console.log(StringScramble('roedc', 'coder')); //true
console.log(StringScramble('h3blle', 'hello')); //false
