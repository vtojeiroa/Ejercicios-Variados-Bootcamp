const express = require("express");
const app = express();

app.get("/", (req, res, next) => {
  const now = new Date();
  const hour = now.getHours();

  if (hour < 20) {
    return next(new Error("Estoy durmiendo"));
  }

  res.send(`Ola son las ${hour} 👋`);
});

app.use((error, req, res, next) => {
  res.status(503).send("Estoy durmiendo...");
});

app.use((req, res) => {
  res.status(404).send("Not found 🏴‍☠️");
});

app.listen(3000, () => {
  console.log("Servidor web iniciado 🧸");
});
