'use strict';
/* 
//Forma Facil
class Animal {}
class Fox extends Animal {
  breed() {
    return new Fox();
  }
}
class Chicken extends Animal {
  breed() {
    return new Chicken();
  }
}

class Room {
  animals = [];
  constructor(animals) {
    this.animals = animals;
  }
  closeDoor() {
    if (this.animals[0].constructor.name === this.animals[1].constructor.name) {
      this.animals.push(this.animals[0].breed());
    } else {
      this.animals = this.animals.filter((animal) => {
        return animal.constructor.name === 'Fox';
      });
    }
  }
  openDoor() {
    return this.animals;
  }
}

const myAnimals = [new Fox(), new Fox()];
console.log(myAnimals);
const myRoom = new Room(myAnimals);
myRoom.closeDoor();
console.log(myRoom.openDoor());
 */
//Otra Forma

class Animal {}
class Fox extends Animal {
  // Cuando cria el zorro devuelve una nueva instancia de un zorro
  breed() {
    return new Fox();
  }
  // cuando el zorro come filtra el array que le pasamos dejando sólo zorros dentro
  eat(animals) {
    return animals.filter((animal) => {
      return animal instanceof Fox;
    });
  }
}
class Chicken extends Animal {
  // Cuando cria la gallina devuelve una nueva instancia de una gallina
  breed() {
    return new Chicken();
  }
}

class Room {
  animals = [];
  constructor(animals) {
    this.animals = animals;
  }
  magic() {
    this.closeDoor();
    return this.openDoor();
  }
  closeDoor() {
    // Si los animales se han creado a partir de la misma clase crian
    if (this.animals[0].constructor.name === this.animals[1].constructor.name) {
      // Tanto zorros como gallinas tienen metodo para criar que se llama de forma identica, pero cada uno nos devuelve instancias del tipo correcto
      this.animals.push(this.animals[0].breed());
    } else {
      // Si son de tipos distintos, uno va a ser un zorro, buscamos al zorro, si el zorro no está en la posición 0 estará en la 1
      const foxPosition = this.animals[0] instanceof Fox ? 0 : 1;
      // Ahora que sabemos donde está el zorro, lo usamos para que coma
      this.animals = this.animals[foxPosition].eat(this.animals);
    }
  }
  openDoor() {
    // Al abrir la puerta devolvemos los animales que hay dentro
    return this.animals;
  }
}

// Creamos un animal de tipo aleatorio
function getRandomAnimal() {
  if (Math.round(Math.random())) {
    return new Fox();
  } else {
    return new Chicken();
  }
}

const myAnimals = [getRandomAnimal(), getRandomAnimal()];
console.log(myAnimals);
const myRoom = new Room(myAnimals);
myRoom.closeDoor();
console.log(myRoom.openDoor());
