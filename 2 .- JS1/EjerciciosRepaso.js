'use strict';

/**
 * #######################
 * ####  R E D U C E  ####
 * #######################
 *
 * Devolver un nuevo array cuyos valores sean el doble del array original.
 *
 */

/* const euros = [29, 41, 46];

const doubled = euros.reduce((accumulator, currentValue) => {
  accumulator.push(currentValue * 2);
  return accumulator;
}, []); // accumulator = [];

console.log(doubled); */

/**
 * #######################
 * ####  R E D U C E  ####
 * #######################
 *
 * Devolver un nuevo array en el cuÃ¡l se filtren solo los valores superiores a 30.
 *
 */

/* const euro = [29, 41, 46, 11, 34, 0];

const above30 = euro.reduce((accumulator, currentValue) => {
	if (currentValue > 30) {
		accumulator.push(currentValue);
	}
	return accumulator;
}, []);

console.log(above30); */

/**
 * #######################
 * ####  R E D U C E  ####
 * #######################
 *
 * Sumar los valores de un array.
 *
 */

/* const num = [5, 8, 9];

const money = 50;

const sum = num.reduce((accumulator, currentValue) => {
	return accumulator += currentValue;
}, money); // accumulator = money

console.log(sum); */

/**
 * #######################
 * ####  R E D U C E  ####
 * #######################
 *
 * Devuelve un objeto cuyas propiedades serÃ¡n el nombre de los distintos valores
 * del array. El valor de estas propiedades serÃ¡ el nÃºmero de veces que esta se
 * repita en el array.
 *
 */

// Vamos a utilizar este mismo array en ejercicios posteriores, Â¡no lo comentes!
const fruitBasket = [
  'banana',
  'cherry',
  'orange',
  'apple',
  'cherry',
  'orange',
  'apple',
  'banana',
  'cherry',
  'orange',
  'fig'
];

/* const count = fruitBasket.reduce((accumulator, currentValue) => {

	// "accumulator" no es un array, es un objeto. Puede parecer que estamos apuntando a un Ã­ndex de un array pero
	// no es asÃ­, no debÃ©is confundirlo. Lo que hacemos es comprobar si la propiedad existe. Si no existe, vamos a
    // a asignarle "0" por defecto (podemos decir que || en este caso no es un "OR", sino un "default"). A mayores le
	// vamos a sumar 1.
	//
    // En caso de que la propiedad exista simplemente le sumamos +1 al valor actual, es decir, aumentamos una unidad el valor.
	accumulator[currentValue] = (accumulator[currentValue] || 0) + 1;

	// Una vez se haya recorrido todo el array se devuelve el valor de "accumulator".
	return accumulator;
}, {}); // accumulator = {};

console.log(count)  */

/**
 * #######################
 * ####  R E D U C E  ####
 * #######################
 *
 * Devuelve un objeto cuyas propiedades serÃ¡n el nombre de los distintos valores
 * del array. El valor de estas propiedades serÃ¡ el nÃºmero de veces que esta se
 * repita en el array. Es una alternativa a un ejercicio anterior.
 *
 */

/* const distinct = fruitBasket.reduce((accumulator, currentValue) => {
	accumulator[currentValue] = 1;
	return accumulator;
}, {}); // accumulator = {};

console.log(distinct) */

/**
 * #######################
 * ####  R E D U C E  ####
 * #######################
 *
 * Devolver un nuevo array cuyos valores sean el doble del array original.
 *
 */

/* const count2 = fruitBasket.reduce((accumulator, currentValue) => {
    // Lo que estamos comprobando con este "if" es si la propiedad existe.
    // Si no existe la creamos y le asignamos el valor "1":
	if (!accumulator[currentValue]) {
		accumulator[currentValue] = 1;
	} else { // Si el objeto existe le sumamos una unidad.
		accumulator[currentValue] += 1;
	}
	return accumulator;
}, {}); // accumulator = {};

console.log(count2) */

/**
 * #######################
 * ####  F I L T E R  ####
 * #######################
 *
 * El filter siempre comprueba una condiciÃ³n. Si esta se cumple dejarÃ¡ pasar los
 * elementos correspondientes, de lo contrario no. En este caso el filter solo
 * deja pasar los nÃºmeros cuyo valor sea mayor que 10.
 *
 */

/* const numbers = [1, 5, 23, 4, 12, 45, 78, 8, 9, 10, 11];

let greaterTen2 = numbers.filter((currentValue) => currentValue > 10 );

console.log(greaterTen2);  */

/**
 * #######################
 * ####  F I L T E R  ####
 * #######################
 *
 * Este filter recorre un array de objetos. Se supone que cada objeto representa
 * a un estudiante distinto. Cada estudiante tiene dos propiedades: nombre y nota.
 * Este filter solo dejarÃ¡ pasar a los estudiantes cuya nota es igual o superior a 11.
 *
 */

/* let students = [
	{
		name: 'Alvaro',
		score: 10
	},
	{
		name: 'Daniel',
		score: 16
	},
	{
		name: 'Alexys',
		score: 12
	},
	{
		name: 'Rafa',
		score: 17
	},
	{
		name: 'Alejandro',
		score: 8
	},
	{
		name: 'Sofia',
		score: 9
	}
];

let approved = students.filter(student => student.score >= 11);

console.log(approved); */

/**
 * #################
 * ####  M A P  ####
 * #################
 *
 * Este map recorre "una copia un array" (porque asÃ­ lo he querido yo). Recordemos que puede ser importante conservar el
 * array original, por eso trabajo sobre la copia. PodrÃ­amos trabajar directamente sobre el array "numbers" pero entonces
 * este cambiarÃ­a.
 *
 * Lo que hago es recorrer la copia del array multiplicando cada una de sus posiciones x2.
 *
 */

/* const numbers = [3, 4, 12, 9];

// Puedo asignar al map una copia del array directamente tal y como hago a continuaciÃ³n.
const double = [...numbers].map((currentValue, index, array) => {
    return array[index] = currentValue * 2;
})

console.log(double); */
