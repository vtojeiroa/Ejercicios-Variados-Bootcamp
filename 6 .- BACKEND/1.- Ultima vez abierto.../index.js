const { formatDistance } = require("date-fns");
const { es } = require("date-fns/locale");
const fs = require("fs").promises;
const path = require("path");

const lastUpdateFile = path.join(__dirname, "lastUpdate.txt");

async function main() {
  try {
    const data = await fs.readFile(lastUpdateFile);

    console.log(
      `La última vez que me abriste fue hace: ${formatDistance(
        new Date(),
        new Date(data.toString()),
        { locale: es }
      )}`
    );
  } catch (error) {
    console.log("Es la primera vez que me ejecutas");
  } finally {
    await fs.writeFile(lastUpdateFile, new Date().toString());
  }
}

main();
