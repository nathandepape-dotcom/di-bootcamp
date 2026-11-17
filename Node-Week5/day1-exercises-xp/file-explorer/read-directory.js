// Exercise 7: list the files of a directory
const fs = require("fs");

const directory = process.argv[2] || __dirname;
const files = fs.readdirSync(directory);

console.log(`Files in ${directory}:`);
files.forEach((file) => console.log("- " + file));
