// 🌟 Exercise 4 : Control Flow with if...else
// Write a function that takes a number as input and returns a string indicating
// whether the number is positive, negative, or zero. Use if...else statements.

function checkNumber(num: number): string {
  if (num > 0) {
    return "positive";
  } else if (num < 0) {
    return "negative";
  } else {
    return "zero";
  }
}

console.log(checkNumber(5));  // positive
console.log(checkNumber(-3)); // negative
console.log(checkNumber(0));  // zero
