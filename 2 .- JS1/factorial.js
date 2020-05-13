//Factorial

'use strict';

function factorial(ammount) {
  if (ammount <= 1) {
    return 1;
  }
  return ammount * factorial(ammount - 1);
}
console.log(factorial(5));

//Otro calculo factorial

('use strict');

let total = ``;
function factorial(ammount) {
  let value = 1;
  if (ammount > 1) {
    for (let i = 2; i <= ammount; i++) {
      value = value * i;
    }
  }
  return value;
}

console.log(factorial(0));
