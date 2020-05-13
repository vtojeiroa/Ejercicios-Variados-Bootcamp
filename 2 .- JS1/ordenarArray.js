'use strict';

// ordenación BubbleSort

const desordenado = [7, 5, 10, 3, 4];

function bubbleSort(desordered) {
  const ordered = [...desordered];

  for (let i = 0; i < ordered.length; i++) {
    for (let j = 0; j < ordered.length; j++) {
      if (ordered[i] < ordered[j]) {
        const temp = ordered[j];
        ordered[j] = ordered[i];
        ordered[i] = temp;
      }
    }
  }

  return ordered;
}
console.log(desordenado, bubbleSort(desordenado));

/* const ordenaEsto = [7, 5, 10, 3, 4];

function ordenar(ordenaEsto) {
  const mallao = [];
  for (let i = 0; i < ordenaEsto.length; i++) {
    if (ordenaEsto[1] > ordenaEsto[2]) {
      ordenaEsto[1] = mallao[0];
      ordenaEsto[i + 1] = mallao[1];
    }
    return mallao;
  }
}
console.log(ordenaEsto);
console.log(ordenar(ordenaEsto)); */
