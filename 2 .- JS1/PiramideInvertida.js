'use strict';

let height = 9;

function builtFloor(size, brick) {
  let floor = ``;

  for (let i = 0; i < size; i++) {
    if (i < size) {
      floor = floor + brick;
    }
  }
  return floor;
}
function builtPiramide(numberFloor) {
  for (let i = 1; i <= numberFloor; i++) {
    console.log(builtFloor(numberFloor - i / 2, ` `) + builtFloor(i++, `*`));
  }
}
builtPiramide(height);

function builtPiramideInv(numberSub) {
  for (let j = numberSub - 2; j >= 1; j--) {
    console.log(builtFloor(numberSub - j / 2, ` `) + builtFloor(j--, `*`));
  }
}
builtPiramideInv(height);
