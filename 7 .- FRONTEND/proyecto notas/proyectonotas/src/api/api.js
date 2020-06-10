//EXPRESS
const express = require("express");
//CORS
const cors = require("cors");
//BODYPARSER
const bodyParser = require("body-parser");
//MYSQL
const mysql = require("mysql");
//APP
const app = express();

//APP USES
app.use(cors());
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());

//DATOS DE CONEXION A LA BBDD
const connection = mysql.createConnection({
  host: "localhost", //HOST
  user: "vtojeiroa", //USUARIO
  password: "123456", //CONTRASEÑA
  database: "notas", //BBDD QUE VOY A USAR
});

// CONEXION CON LA BBDD
connection.connect((error) => {
  if (error) throw error;
  console.log("DATABASE UP");
});

// PUERTO DE CONEXION DE LA API
const PORT = 3050;

app.listen(PORT, () => console.log("API UP"));

//GET DE PRUEBA

app.get("/", (req, res) => {
  res.send("Te doy la bienvenida a mi API");
});

//RECOGIENDO TODAS LAS NOTAS

app.get("/notas", (req, res) => {
  //  SEQUENCIA SQL
  const sql = `SELECT * FROM lista_notas`;
  //CONEXIÓN Y EJECUCION DEL SQL
  connection.query(sql, (error, results) => {
    // SI HAY ERROR, QUE LO MUESTRE
    if (error) throw error;
    //COMPROBAR QUE LA RESPUESTA NO VIENE VACIA
    if (results.length > 0) {
      res.json(results);
    }
    //EN CASO DE QUE VENGA VACIA
    else {
      res.send("Lista de notas no encontrada");
    }
  });
});

// ACTUALIZANDO UNA NOTA

app.put("/notas/update/:id", (req, res) => {
  //Texto e id que nos llegan del formulario

  const { texto, id } = req.body;
  /*   const texto = req.body.texto;
  const id = req.body.id; */
  // Secuencia SQL
  const sql = `UPDATE lista_notas SET texto='${texto}' WHERE id=${id}`;
  connection.query(sql, (error) => {
    if (error) throw error;
    res.send("Nota actualizada");
  });
});

//BORRANDO UNA NOTA

app.delete("/notas/del/:id", (req, res) => {
  //GUARDAMOS LA ID QUE NOS LLEGA
  const id = req.params.id;

  //SECUENCIA SQL A EJECUTAR
  const sql = `DELETE FROM lista_notas WHERE id=${id}`;
  //CONEXION
  connection.query(sql, (error) => {
    if (error) throw error;
    res.send("Nota borrada");
  });
});
//AÑANDIENDO UNA NOTA

app.post("/notas/add", (req, res) => {
  //sequencia SQL
  const sql = `INSERT INTO lista_notas SET ?`;
  // Objeto que recibe la BBDD
  const newNote = {
    texto: req.body.texto,
  };
  //CONEXION Y EJECUCION DE SQL
  connection.query(sql, newNote, (error) => {
    if (error) throw error;
    res.send("Nota creada");
  });
});

//BUSCAR UNA NOTA POR ID

app.get("/notas/:id", (req, res) => {
  const id = req.params.id;
  //sequencia SQL
  const sql = `SELECT * FROM lista_notas WHERE id ='${id}'`;

  //CONEXION Y EJECUCION DE SQL
  connection.query(sql, (error, results) => {
    if (error) throw error;
    if (results.length > 0) {
      res.json(results);
    } else {
      res.send("Nota no encontrada");
    }
  });
});
