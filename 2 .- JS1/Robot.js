'use strict';

class Robot {
  // Movimiento entre columnas.
  col = 0;
  // Movimiento entre filas.
  row = 0;
  constructor(name) {
    this.name = name;
  }
  // Mover a la derecha
  moveRight(array) {
    // Comprobamos que el robot no se salga del array.
    if (this.col < array.length - 1) {
      this.col++;
      return true;
    }
    return false;
  }

  // Mover a la izquierda
  moveLeft(array) {
    // Comprobamos que el robot no se salga del array.
    if (this.col > 0) {
      this.col--;
      return true;
    }
    return false;
  }

  // Mover arriba
  moveUp(array) {
    // Comprobamos que el robot no se salga del array.
    if (this.row > 0) {
      this.row--;
      return true;
    }
    return false;
  }

  // Mover abajo
  moveDown(array) {
    // Comprobamos que el robot no se salga del array.
    if (this.row < array.length - 1) {
      this.row++;
      return true;
    }
    return false;
  }

  // Mostrar dÃ³nde estÃ¡ el robot
  showPosition(array) {
    return array[this.row][this.col];
  }
}

const myArray = [
  [5, 1, 2],
  [4, 7, 8],
  [9, 3, 6]
];

// Creamos una nueva instancia de Robot. Es muy importante saber quÃ© es
// instanciar una clase, pues es exactamente lo que hacemos a continuaciÃ³n.
const Robocop = new Robot('Robocop');

// Ahora podemos mover al robot por el array utilizando los mÃ©todos que
// hemos creado en la clase Robot. Recordad que denominamos mÃ©todo a una funciÃ³n
// dentro de una clase.
console.log(Robocop.moveDown(myArray));
console.log(Robocop.moveDown(myArray));
console.log(Robocop.moveDown(myArray));
console.log(Robocop.moveRight(myArray));
console.log(Robocop.moveRight(myArray));
console.log(Robocop.moveRight(myArray));

// Mostrar en quÃ© posiciÃ³n del array se encuentra mi robot.
console.log(Robocop.showPosition(myArray));
