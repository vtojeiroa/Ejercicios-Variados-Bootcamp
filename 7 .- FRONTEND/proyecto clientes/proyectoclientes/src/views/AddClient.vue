<template>
  <div>
    <!-- FORMULARIO -->
    <div>
      <p v-show="required">Tienes datos aún por rellenar.</p>
      <!-- NOMBRE -->
      <label for="nombre">Nombre:</label>
      <input type="text" name="nombre" placeholder="Nombre del cliente" v-model="nombre" />
      <br />
      <!-- APELLIDO -->
      <label for="apellido">Apellido:</label>
      <input type="text" name="apellido" placeholder="Apellido del cliente" v-model="apellido" />
      <br />
      <label for="ciudad">Ciudad:</label>
      <input type="text" name="ciudad" placeholder="Ciudad del cliente" v-model="ciudad" />
      <br />
      <label for="empresa">Empresa:</label>
      <input type="text" name="empresa" placeholder="Empresa del cliente" v-model="empresa" />
      <br />
      <button @click="addClient(nombre,apellido,ciudad,empresa)">CREAR</button>
    </div>
    <!-- FORMULARIO -->
  </div>
</template>

<script>
// IMPORTO AXIOS
import axios from "axios";

export default {
  name: "AddClient",
  data() {
    return {
      nombre: " ",
      apellido: " ",
      ciudad: " ",
      empresa: " ",
      correctData: false,
      required: false
    };
  },
  methods: {
    validatingData() {
      if (
        this.nombre === "" ||
        this.apellido === "" ||
        this.ciudad === "" ||
        this.empresa === ""
      ) {
        this.correctData = false; //   NO ENVIAR
        this.required = true; //SE MUESTRA MENSAJE
      } else {
        this.correctData = true; // SI ENVIAR
        this.required = false; //NO SE MUESTRA MENSAJE
      }
    },

    addClient(nombre, apellido, ciudad, empresa) {
      this.validatingData(); //VALIDANDO DATOS DEL FORMULARIO--QUE VENGAN TODOS CUBIERTOS
      if (this.correctData == true) {
        let self = this;
        axios
          .post("http://localhost:3051/add", {
            nombre: self.nombre,
            apellido: self.apellido,
            ciudad: self.ciudad,
            empresa: self.empresa
          })
          .then(function(response) {
            self.emptyFields(); //VACIAR LOS CAMPOS DEL FORMULARIO DESPUES DE DAR DE ALTA AL CLIENTE
            console.log(response);
          })
          .catch(function(error) {
            console.log(error);
          });
      } else {
        alert("No has rellenado todos los campos");
      }
    },
    emptyFields() {
      (this.nombre = ""),
        (this.apellido = ""),
        (this.ciudad = ""),
        (this.empresa = "");
    }
  }
};
</script>

<style scoped>
p {
  color: red;
}
</style>