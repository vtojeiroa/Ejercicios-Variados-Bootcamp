const http = require("http");
const { differenceInSeconds } = require("date-fns");

const server = http.createServer();

server.on("request", function (req, res) {
  if (req.url === "/freedom" && req.method.toUpperCase() === "GET") {
    // res.statusCode = 200;
    // res.setHeader("Content-type", "application/json");
    // res.setHeader("X-Powered-By", "Hackaboss");
    // la siguiente línea sustituye a las anteriores

    res.writeHead(200, {
      "Content-Type": "application/json",
      "X-Powered-By": "Hackaboss",
    });

    const quarentineEnd = new Date(2020, 5, 31);
    const remainingSeconds = differenceInSeconds(quarentineEnd, new Date());

    return res.end(
      JSON.stringify({
        message: `Faltan ${remainingSeconds} segundos para el final de la cuarentena`,
      })
    );
  } else {
    res.statusCode = 404;
    res.end("Not found");
  }
});

server.listen(3000);
