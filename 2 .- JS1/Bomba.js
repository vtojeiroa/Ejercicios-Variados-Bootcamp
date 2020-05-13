'use strict';

function getBombCode() {
    return Math.round(Math.random() * 10);
}

function defuseBomb() {
    const bombCode = getBombCode();
    console.log(getBombCode);

    for (let i = 0; i < 5; i++) {
        const victimGuess = +prompt(`plata o plomo`);
        if (victimGuess === bombCode) {
            return true;
        }
    }
    return false;
}
function playBomb() {
    if (defuseBomb(){
        console.log(`Correcto!!!!`);
    else {
            console.log(`Booommmmm!!!!`);
        }
    }
}
playBomb();

//BOMBA

function bomb() {
    for (let i = 0; i < 5; i++) {
        answer = prompt(`Dime un numero del 1 al 10`);

        if (parseInt(answer) === numberRedondeado) {
            console.log(`Eres un maquina`);
            break;
        } else {
            console.log(`Try Again`);
        }
        if (i =)
  }
}
bomb();

let code = Math.round(Math.random() * 10);
return code;
return Math.round(Math.random() * 10);