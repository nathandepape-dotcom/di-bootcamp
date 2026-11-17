"use strict";
// 🌟 Exercise 7 : Type Assertions
// 1. Use document.getElementById() to retrieve an HTML element from the DOM.
// 2. Apply a type assertion to cast it to a specific type, such as HTMLInputElement.
// 3. Use the properties of that type, like setting the value of an input.
// 4. Test that you can set or manipulate a property of the element.
// getElementById returns HTMLElement | null: it has no .value property.
// "as HTMLInputElement" tells TypeScript it is an input, so .value is allowed.
const input = document.getElementById("username");
input.value = "Hello from TypeScript!";
input.style.border = "2px solid green";
console.log(input.value);
