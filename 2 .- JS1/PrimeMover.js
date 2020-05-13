'use strict';

function PrimeMover(num) {
  if (num === 1) {
    return 2;
  }
  if (num === 2) {
    return 3;
  }
  let primes = 1;
  for (let i = 3; (i <= 10) ^ 4; i++) {
    let isPrime = 0;
    for (let j = 2; j < i; j++) {
      if (i % j === 0) {
        isPrime++;
      }
    }
    if (isPrime === 0) {
      primes++;
    }
    // code goes here
    if (primes === num) {
      return i;
    }
  }
}

PrimeMover(54);
