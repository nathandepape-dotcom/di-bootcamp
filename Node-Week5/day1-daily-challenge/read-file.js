// Task 3: Advanced File Operations
const fs = require("fs");
const path = require("path");

function readFileContent() {
    // __dirname = folder of this file, so it works from anywhere
    const filePath = path.join(__dirname, "files", "file-data.txt");
    const content = fs.readFileSync(filePath, "utf-8");
    console.log(content);
}

module.exports = readFileContent;
