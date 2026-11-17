// Exercise 7: copy source.txt into destination.txt
const fs = require("fs");
const path = require("path");

const source = path.join(__dirname, "source.txt");
const destination = path.join(__dirname, "destination.txt");

const content = fs.readFileSync(source, "utf-8");
fs.writeFileSync(destination, content);
console.log("Copied source.txt to destination.txt");
