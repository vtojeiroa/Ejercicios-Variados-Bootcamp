'use strict';

const calculatedFibonacci = { 0: 0, 1: 1 };
function fibonacci(ammount) {
  if (calculatedFibonacci[ammount] || ammount === 0) {
    return calculatedFibonacci[ammount];
  }
  const prevFib = fibonacci(ammount - 1);
  calculatedFibonacci[ammount - 1] = prevFib;
  const prevPrevFib = fibonacci(ammount - 2);
  calculatedFibonacci[ammount - 2] = prevPrevFib;
  return prevFib + prevPrevFib;

  return fibonacci(ammount - 1) + fibonacci(ammount - 2);
}
console.log('Resultado', fibonacci(10));

//numero fibonacci

('use strict');

function fibonacci(ammount) {
  if (ammount <= 1) {
    return ammount;
  }
  return fibonacci(ammount - 1) + fibonacci(ammount - 2);
}
console.log(fibonacci(3));
