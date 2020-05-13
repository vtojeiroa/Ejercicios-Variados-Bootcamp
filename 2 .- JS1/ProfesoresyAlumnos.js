* Asignar una serie de alumnos a una serie profesores en base a ciertas propiedades.
 *
 * - 1. Clase Persona: la clase persona va a tener un "nombre", "edad" y un mÃ©todo que nos devuelva un
    * mensaje diciendonos el nombre y la edad.
 *
 * - 2. Clase Alumno que hereda de Persona: tendrÃ¡n los atributos "materia" y "grupo".Necesitamos
    * a mayores un mÃ©todo estÃ¡tico que genere los alumnos.
 *
 * - 3. Clase Profesor que hereda de Persona: tendrÃ¡n los atributos "materia" y "grupo".Necesitamos
    * a mayores un mÃ©todo estÃ¡tico que genere los profesores,
 * y otro mÃ©todo no estÃ¡tico que asigne los estudiantes al
    * profesor.
 *
 * /

// ###############################
// ### C l a s s   P e r s o n ###
// ###############################
class Person {
    constructor(name, age) {
        this.name = name;
        this.age = age;
    }
    // MÃ©todo no estÃ¡tico que nos va a devolver un mensaje con el nombre y la edad.
    showInformation() {
        console.log(`Hola, me llamo ${this.name} y tengo ${this.age} aÃ±os.`)
    }
}

// #################################
// ### C l a s s   S t u d e n t ###
// #################################
class Student extends Person {
    constructor(name, age, subject, group) {
        super(name, age);
        this.subject = subject;
        this.group = group;
    }
    // MÃ©todo estÃ¡tico que genera nuevos estudiantes a partir de unos arrays
    // con informaciÃ³n.
    static generateStudents(names, ages) {
        return names.map((currentValue, index) => {
            const subjects = (Math.round(Math.random()) === 0) ? 'html' : 'js';
            const groups = (Math.round(Math.random()) === 0) ? 'A' : 'B';
            return new Student(currentValue, ages[index], subjects, groups);
        })
    }
}

// Array con los nombres y edades de los estudiantes
const studentsNames = ['Laura', 'RamÃ³n', 'Jorge', 'Dani', 'Eustaquia', 'Raimunda', 'Jaimito', 'Sara', 'Lucas']
const studentsAges = [19, 34, 67, 43, 22, 26, 45, 32, 25]

// Lista de estudiantes
const studentList = Student.generateStudents(studentsNames, studentsAges);

// #################################
// ### C l a s s   T e a c h e r ###
// #################################
class Teacher extends Person {
    studentsAssigned = [];
    constructor(name, age, subject, group) {
        super(name, age);
        this.subject = subject;
        this.group = group;
    }
    // MÃ©todo estÃ¡tico que genera nuevos profesores a partir de unos arrays
    // con informaciÃ³n.
    static generateTeachers(names, ages, subjects, groups) {
        return names.map((currentValue, index) => {
            return new Teacher(
                currentValue,
                ages[index],
                subjects[index],
                groups[index]
            );
        });
    }
    // MÃ©todo no estÃ¡tico para asignar estudiantes al profesor.
    assignStudents(students) {
        // Almacenamos los estudiantes cuyas propiedades "subject" y
        // "group" coinciden con las del profesor. En lugar de 
        // "currentValue" tendrÃ­a mÃ¡s sentido poner "student" dado
        // que sabemos de antemano que el array que vamos a recorrer
        // es una lista de estudiantes.
        this.studentsAssigned = students.filter(currentValue => {
            return (
                this.subject === currentValue.subject &&
                this.group === currentValue.group
            );
        })
    }
}

// Array con la info de los profesores
const teachersNames = ['Palleiro', 'Yanez', 'Mato', 'Yago'];
const teachersAges = [24, 45, 65, 98];
const teachersSubjects = ['js', 'js', 'html', 'html'];
const teachersGroups = ['A', 'B', 'A', 'B'];

// Lista de profesores
const teacherList = Teacher.generateTeachers(teachersNames, teachersAges, teachersSubjects, teachersGroups);

// Recorremos la lista de profesores ya instanciados y llamÃ¡mos al mÃ©todo
// "assignStudents" para asignarle estudiantes. Para ser mÃ¡s descriptivos
// deberÃ­amos cambiar el nombre de "currentValue" por "teacher" porque vamos
// a recorrer una lista de profesores.
for (const currentValue of teacherList) {
    currentValue.assignStudents(studentList);
}

// Compruebo con este console.log que se han asignado los estudiantes.
console.log(teacherList);
