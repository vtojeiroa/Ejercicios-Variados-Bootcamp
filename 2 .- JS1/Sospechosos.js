'use strict';

//SOSPECHOSOS Y DECTECTIVE Son Clases
//Nombre, Color de ojos, altura y si es tan tatuados o no.
//Cada sospechoso tiene una pista sobre quien es el culpable
// y no miente nadie.

const names = ['Willy', 'Ivan', 'Ramiro'];
const eyeColor = ['azul', 'marron', 'azul'];
const height = ['bajo', 'alto', 'alto'];
const tattooed = [true, false, false];
const tip = [
  {
    height: 'alto'
  },
  {
    eyeColor: 'marron'
  },
  {
    tattooed: false
  }
];
class Person {
  #age = 0;
  constructor(name) {
    this.name = name;
  }
  set age(newAge) {
    this.#age = newAge * 2;
  }
  get age() {
    return this.#age / 2;
  }
}

class Detective extends Person {
  suspects = [];
  summary = {};
  guilties = [];
  constructor(name) {
    super(name);
  }
  startInvestigation(names, eyeColor, height, tattooed, tip) {
    this.suspects = Suspect.createList(names, eyeColor, height, tattooed, tip);
  }
  gatherData() {
    for (let i = 0; i < this.suspects.length; i++) {
      const confession = this.suspects[i].confess();
      this.summary = { ...this.summary, ...confession };
    }
  }
  blame() {
    const summaryKeys = Object.keys(this.summary);
    this.guilties = this.suspects.filter((suspect) => {
      let matches = 0;
      for (const summaryKey of summaryKeys) {
        if (this.summary[summaryKey] === suspect[summaryKey]) {
          matches++;
        }
      }
      return matches === summaryKeys.length;
    });
  }
}

/* checkGuilt(suspect) {
    // const summaryKeys = Object.keys(summary);
    return (
      this.summary.eyeColor === suspect.eyeColor &&
      this.summary.height === suspect.height &&
      this.summary.tattooed === suspect.tattooed
    );
  } */

class Suspect extends Person {
  #tip;
  constructor(name, eyeColor, height, tattooed, tip) {
    super(name);
    this.eyeColor = eyeColor;
    this.height = height;
    this.tattooed = tattooed;
    this.#tip = tip;
  }

  confess() {
    return this.#tip;
  }

  static createList(names, eyeColors, heights, tattooeds, tips) {
    return names.map((name, index) => {
      return new Suspect(name, eyeColors[index], heights[index], tattooeds[index], tips[index]);
    });
  }
}

const myDetective = new Detective('Horatio');
myDetective.name = 'Clodoveo;';
myDetective.startInvestigation(names, eyeColor, height, tattooed, tip);
myDetective.gatherData();
myDetective.blame();
console.log(myDetective.guilties);

const randomSuspect = new Suspect();
