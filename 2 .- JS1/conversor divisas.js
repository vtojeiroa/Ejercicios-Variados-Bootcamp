'use strict';
let coin = 'Dollar';
let value = 10;

if (coin === 'Euro') {
  console.log('El valor en Euros es ' + value * 1);
} else if (coin === 'Libra') {
  console.log('El valor en Libras es ' + value * 1.5);
} else if (coin === 'Dollar') {
  console.log('El valor en Dolares es ' + value * 1.2);
} else {
  console.log('No tenemos esa divisa');
}

let otraCoin = 'Dollar';
let otroValue = 10;
switch (otraCoin) {
  case 'yen':
    console.log('El valor en Yenes es ' + otroValue * 1);
    break;
  case 'Dollar':
    console.log('El valor en Dolares es ' + otroValue * 2.2);
    break;
  case 'Euro':
    console.log('el valor en Euros es ' + otroValue * 1.8);
    break;
  default:
    console.log('No tenemos esa divisa');
}
