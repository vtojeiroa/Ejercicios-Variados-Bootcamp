'use strict';

const enfermos = [true, false, true, false, false, false, true];

const enfermosClone = [...enfermos];
const enfermosClone2 = [...enfermos];
const enfermosClone3 = [...enfermos];

for (let i = 0; i < enfermos.length; i++) {
  if (enfermos[i - 1] || enfermos[i + 1]) {
    enfermosClone[i] = true;
  }
}

console.log(enfermosClone);

for (let i = 0; i < enfermos.length; i++) {
  if (!(!enfermos[i - 1] && !enfermos[i + 1])) {
    enfermosClone2[i] = true;
  }
}
console.log(enfermosClone2);

for (let i = 0; i < enfermos.length; i++) {
  if (enfermos[i] === true) {
    enfermosClone3[i] = false;
  } else {
    enfermosClone3[i + 1] = true;
  }
}

console.log(enfermosClone3);

// opcion 1 y 2 con una funcion

const enfermos = [true, false, true, false, false, false, true];
function contagiar(enfermos) {
  const contagiados = [...enfermos];
  for (let i = 0; i < enfermos.length; i++) {
    if (enfermos[i]) {
      if (i > 0) {
        contagiados[i - 1] = true;
      }
      if (i !== enfermos.length - 1) {
        contagiados[i + 1] = true;
      }
    }
  }
  return contagiados;
}
console.log(enfermos);
console.log(contagiar(enfermos));

//opcion 3 con funcion.

const enfermos = [true, false, true, false, false, false, true];
function contagiar(enfermos) {
  const contagiados = [...enfermos];
  for (let i = 0; i < enfermos.length; i++) {
    if (enfermos[i]) {
      if (i > 0) {
        contagiados[i - 1] = true;
      }
      if (i !== enfermos.length - 1) {
        contagiados[i + 1] = true;
      }
      contagiados[i] = false;
    }
  }
  return contagiados;
}
console.log(enfermos);
console.log(contagiar(enfermos));
