// 🌟 Exercise 9 : Function Overloading with Default Parameters
// Create an overloaded function greet that can either take a name and greet the person,
// or take no arguments and return a default greeting.

// Overload signatures (no body): the two ways the function can be called
function greet(): string;
function greet(name: string): string;

// Implementation (one body for all the signatures), with a default parameter
function greet(name: string = "stranger"): string {
  return `Hello, ${name}!`;
}

console.log(greet());         // Hello, stranger!
console.log(greet("Nathan")); // Hello, Nathan!
