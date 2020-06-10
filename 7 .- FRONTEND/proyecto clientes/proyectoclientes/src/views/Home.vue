<template>
  <div class="home">
    <h2>Lista de clientes</h2>
    <div
      class="clientes"
      v-for="(cliente, index) in clientes"
      :key="cliente.id"
    >
      <p>ID: {{ cliente.id }}</p>
      <p>Nombre: {{ cliente.nombre }}</p>
      <p>Apellido: {{ cliente.apellido }}</p>
      <p>Ciudad: {{ cliente.ciudad }}</p>
      <p>Empresa: {{ cliente.empresa }}</p>
      <button @click="deleteClients(index)">BORRAR</button>
    </div>
  </div>
</template>

<script>
// @ is an alias to /src
import axios from "axios";

export default {
  name: "Home",
  components: {},
  data() {
    return {
      //ARRAY DE LOS CLIENTES DE LA BBDD
      clientes: [],
    };
  },
  methods: {
    getClients() {
      let self = this;
      axios
        .get("http://localhost:3051/clientes")
        //SI SALE BIEN
        .then(function(response) {
          console.log(response);
          self.clientes = response.data;
        })
        //SI SALE MAL
        .catch(function(error) {
          console.log(error);
        });
    },
    deleteClients(index) {
      this.id = this.clientes[index].id;
      axios
        .delete("http://localhost:3051/clientes/del/" + this.id, {
          id: this.id,
        })
        //  SI SALE BIEN
        .then(function(response) {
          location.reload();
          console.log(response);
        })
        //SI SALE MAL
        .catch(function(error) {
          console.log(error);
        });
    },
  },
  created() {
    this.getClients();
  },
};
</script>
