import persons from "./data.js";

function printAverageAge(people) {
    const total = people.reduce((sum, person) => sum + person.age, 0);
    const average = total / people.length;
    console.log(`Average age: ${average}`);
}

printAverageAge(persons);
