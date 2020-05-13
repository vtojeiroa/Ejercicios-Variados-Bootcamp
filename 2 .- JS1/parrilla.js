'use strict';

function getRows(size) {
  let rows = new Array(size);
  return rows;
}
function fill(rows) {
  for (let i = 0; i < rows.length; i++) {
    rows[i] = new Array(rows.length).fill('0');
  }
  return rows;
}

function getX(size, brick) {
  if (size % 2) {
    let base = fill(getRows(size));
    for (let i = 0; i < base.length; i++) {
      base[i][i] = brick;
      base[i][base.length - 1 - i] = brick;
    }
    return base;
  } else {
    return 'Por favor, introduce un numero impar.';
  }
}

const userImput = prompt('Dime un numero impar.');

function getR(size, brick) {
  if (size % 2) {
    let base = fill(getRows(size));
    for (let i = 0; i < base.length; i++) {
      base[i][i] = brick;
      if (i < base.length / 2) {
        base[i][base.length - 1 - i] = brick;
      }
    }
    return base;
  } else {
    return 'Por favor, introduce un numero impar.';
  }
}

function getL(size, brick) {
  if (size % 2) {
    let base = fill(getRows(size));
    for (let i = 0; i < base.length; i++) {
      base[i][i] = brick;
      if (i > base.length / 2) {
        base[i][base.length - 1 - i] = brick;
      }
    }
    return base;
  } else {
    return 'Por favor, introduce un numero impar.';
  }
}

console.log(getX(+userImput, '*'));
console.log(getR(+userImput, '**'));
console.log(getL(+userImput, '**'));

// resolución Ivan

function diagonals(size) {
  let emptymatrix = generateMatrix(size);
  return createDiagonals(emptyMatrix);
}

function createDiagonals(matrix) {
  for (let i = 0; i < matrix.length; i++) {
    matrix[i][i] = '*';
  }
  return matrix;
}
function generateMatrix(size) {
  const matrix = new Array(size);
  createDiagonals(size, matrix);
  for (let i = 0; i < size; i++) {
    matrix[i] = new Array(size).fill(' ');
  }
  return matrix;
}
console.log(diagonals(5));
