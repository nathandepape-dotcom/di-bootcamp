// Task 2: Using an NPM module (chalk v4 supports require())
const chalk = require("chalk");

function showColorfulMessage() {
    console.log(chalk.bold.green("Node.js") + " + " + chalk.blue("NPM") + " = " + chalk.magenta.underline("magic!"));
}

module.exports = showColorfulMessage;
