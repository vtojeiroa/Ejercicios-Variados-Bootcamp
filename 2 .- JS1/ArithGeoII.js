'use strict';

function ArithGeoII(arr) {
  let ari = true;
  let geo = true;
  for (let i = 2; i < arr.length && (ari || geo); ++i) {
    if (ari && arr[i - 1] - arr[i - 2] !== arr[i] - arr[i - 1]) ari = false;
    if (geo && arr[i - 1] / arr[i - 2] !== arr[i] / arr[i - 1]) geo = false;
  }
  if (ari && geo) return 'both';
  if (ari) return 'Arithmetic';
  if (geo) return 'Geometric';
  // code goes here
  return '-1';
}
console.log(ArithGeoII([5, 10, 15]));
console.log(ArithGeoII([2, 4, 8, 16]));
console.log(ArithGeoII([2, 4, 16]));
