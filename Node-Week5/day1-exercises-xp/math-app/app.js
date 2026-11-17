const _ = require("lodash");
const { add, multiply } = require("./math");

console.log("add(2, 3) =", add(2, 3));
console.log("multiply(4, 5) =", multiply(4, 5));

const numbers = [3, 8, 1, 10];
console.log("lodash sum:", _.sum(numbers));
console.log("lodash max:", _.max(numbers));
console.log("sum of all products by 2:", _.sum(numbers.map((n) => multiply(n, 2))));
