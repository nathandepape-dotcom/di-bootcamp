// 🌟 Exercise 6 : Object Type Annotations
// 1. Create an object type annotation for a Person: name (string) and age (number).
// 2. Write a function createPerson(name: string, age: number) that returns a Person.
// 3. Test it by creating a person and logging the result.

type Person = {
  name: string;
  age: number;
};

function createPerson(name: string, age: number): Person {
  return { name, age };
}

const person = createPerson("Nathan", 19);
console.log(person); // { name: 'Nathan', age: 19 }
