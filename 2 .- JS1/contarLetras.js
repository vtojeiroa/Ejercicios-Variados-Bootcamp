'use strict';

//contar una letra en una frase

const myString = `Me llaman Manolo el del bombo.`;
const myLetter = `m`;
function countLetters(str, letter) {
  str = str.toLowerCase().split(``);
  console.log(str);
  let tmp = 0;
  for (const value of str) {
    if (letter === value) {
      tmp++;
    }
  }
  return tmp;
}

const result = countLetters(myString, myLetter);

console.log(result);
