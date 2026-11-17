// 🌟 Exercise 5 : Tuple Types
// Create a function getDetails that takes a name and age as input and returns a tuple
// containing the input values and a greeting message.

// const details = getDetails("Alice", 25);
// console.log(details); // Output: ["Alice", 25, "Hello, Alice! You are 25 years old."]

function getDetails(name: string, age: number): [string, number, string] {
  return [name, age, `Hello, ${name}! You are ${age} years old.`];
}

const details = getDetails("Alice", 25);
console.log(details); // ['Alice', 25, 'Hello, Alice! You are 25 years old.']
