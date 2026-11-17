// Exercise 3: read and write files with CommonJS
const fs = require("fs");

function readFile(filePath) {
    return fs.readFileSync(filePath, "utf-8");
}

function writeFile(filePath, content) {
    fs.writeFileSync(filePath, content);
}

module.exports = { readFile, writeFile };
