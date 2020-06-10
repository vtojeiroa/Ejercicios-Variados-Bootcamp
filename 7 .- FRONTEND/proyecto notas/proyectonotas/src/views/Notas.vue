<template>
  <div class="home">
    <!-- Uso headful para personalizar el nombre de la página -->
    <vue-headful title="Notas" description="Página de Notas" />

    <h2>Hola!</h2>
    <h4>Puedes crear tus notas con el formulario a continuación:</h4>

    <!-- FORMULARIO PARA AÑADIR NOTAS -->
    <form>
      <label for="texto">Texto de la nota</label>
      <br />
      <textarea
        name="texto"
        id="textarea"
        cols="40"
        rows="5"
        v-model="texto"
      ></textarea>
      <br />
      <button @click="addNote()">CREAR NOTA</button>
    </form>

    <!-- FORMULARIO PARA AÑADIR NOTAS -->
    <h2>Estas son tus Notas</h2>

    <p>Search by id:</p>
    <input v-model="search" type="number" placeholder="Introduce el ID..." />
    <button @click="getNotesById()">BUSCAR</button>
    <button @click="getNotes()">LIMPIAR</button>

    <p>Actualizando tu nota:</p>

    <input v-model="newText" placeholder="El texto saldrá aquí" />
    <button @click="updateNote()">ACTUALIZAR</button>
    <br />
    <br />
    <!-- NOTAS -->
    <notas
      :notas="notas"
      v-on:editar="showEditText"
      v-on:borrar="deleteNotes"
    ></notas>
    <!-- NOTAS -->
  </div>
</template>

<script>
import axios from "axios";
// @ is an alias to /src
//Importando componente de notas
import notas from "@/components/ShowNotas.vue";
import Swal from "sweetalert2";

export default {
  name: "Notas",
  components: {
    notas,
  },
  data() {
    return {
      //variable donde guardo el texto de la nota
      texto: "",
      // Variable donde guardo todas las notas
      notas: [],
      //Nuevo texto de la nota
      newText: "",
      id: null,
      search: "",
    };
  },
  methods: {
    //Funcion para añadir notas
    addNote() {
      let self = this;
      axios
        .post("http://localhost:3050/notas/add", {
          texto: self.texto,
        })
        //me imprimirá la respuesta en consola
        .then(function(response) {
          Swal.fire({
            //Mostar un popup con la info
            title: `Se ha añadido una nueva nota`,
            confirmButtonText: "Ok",
          }).then(
            //recarga la página
            (result) => {
              location.reload();
              console.log(response);
            }
          );
        })
        //Me mostrará el error en consola
        .catch(function(error) {
          console.log(error);
        });
    },
    getNotes() {
      let self = this;
      axios
        .get("http://localhost:3050/notas")
        //Si sale bien, que rellene el array de notas
        .then(function(response) {
          self.notas = response.data;
          self.search = "";
        })
        //Si sale mal
        .catch(function(error) {
          console.log(error);
        });
    },
    showEditText(data) {
      this.newText = data.texto;
      this.id = data.id;
    },

    //FUNCION PARA ACTUALIZAR UNA NOTA
    updateNote() {
      let self = this;
      axios
        .put("http://localhost:3050/notas/update/" + self.id, {
          id: self.id,
          texto: self.newText,
        })
        //SI SALE BIEN
        .then(function(response) {
          Swal.fire({
            //Mostar un popup con la info
            title: `Acabas de actualizar la nota `,
            confirmButtonText: "Ok",
          }).then(
            //recarga la página
            (result) => {
              location.reload();
              console.log(response);
            }
          );
        })
        //SI SALE MAL
        .catch(function(error) {
          console.log(error);
        });
    },

    //FUNCION PARA BORRAR NOTAS
    deleteNotes(data) {
      this.id = data;
      axios
        .delete("http://localhost:3050/notas/del/" + this.id, {
          id: this.id,
        }) //SI SALE BIEN
        .then(function(response) {
          Swal.fire({
            //Mostar un popup con la info
            icon: "success",
            title: `Acabas de borrar la nota`,
            showConfirmButton: false,
            timer: 1500,

            /*       confirmButtonText: "Ok", */
          }).then(
            //recarga la página.
            (result) => {
              location.reload();
              console.log(response);
            }
          );
        })
        //SI SALE MAL
        .catch(function(error) {
          console.log(error);
        });
    },
    //FUNCION PARA BUSCAR UNA NOTA POR EL ID

    getNotesById(id) {
      let self = this;
      id = self.search;
      axios
        .get("http://localhost:3050/notas/" + id, {
          id: this.id,
        })
        .then(function(response) {
          self.notas = response.data;
        })
        .catch(function(error) {
          console.log(error);
        });
    },
  },
  created() {
    //Llamo a getNotes en cuanto la página se crea
    this.getNotes();
  },
};
</script>
