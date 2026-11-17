// Exercise 6: chalk v4 (v5+ only works with import, not require)
const chalk = require("chalk");

console.log(chalk.blue("Hello") + " " + chalk.red.bold("Node.js") + chalk.green("!"));
console.log(chalk.bgYellow.black(" Colorful terminal message "));
console.log(chalk.magenta.underline("NPM makes this easy"));
