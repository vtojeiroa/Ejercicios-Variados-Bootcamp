const os = require("os");
const chalk = require("chalk");

const totalMem = os.totalmem();
const freeMem = os.freemem();

const freePercent = (freeMem * 100) / totalMem;
const humanFreePercent = freePercent.toFixed(2) + "%";

if (freePercent > 75) {
  console.log(chalk.green(humanFreePercent));
} else if (freePercent > 50) {
  console.log(chalk.blue(humanFreePercent));
} else {
  console.log(chalk.red(humanFreePercent));
}
