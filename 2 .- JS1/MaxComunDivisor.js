'use strict';

function Division(num1, num2) {
  let max = 1;
  let min;
  if (num1 > num2) {
    min = num2;
  } else {
    min = num1;
  }
  for (let i = 1; i <= min; i++) {
    if (num1 % i === 0 && num2 % i === 0 && i > max) {
      max = i;
    }
  }
  // code goes here
  return max;
}

// keep this function call here
console.log(Division(7, 3));
