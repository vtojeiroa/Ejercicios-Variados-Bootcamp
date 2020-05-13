'use strict';

//PROGRAMACION FUNCIONAL

const desordenado = [7, 5, 10, 3, 4];

function uppercaseEcho(message) {
  console.log(message.toUpperCase());
}

function lowercaseEcho(message) {
  console.log(message.toLowerCase());
}
function changeCase(caseFunction) {
  const message = `aAaAbBbBB`;
  caseFunction(message);
}

changeCase(uppercaseEcho);
changeCase(lowercaseEcho);
