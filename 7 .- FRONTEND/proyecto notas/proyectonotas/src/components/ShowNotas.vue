<template>
  <div>
    <div class="nota" v-for="(nota, index) in notas" :key="nota.id">
      {{ nota.texto }}
      <button @click="editNoteEvent(index)">EDITAR</button>
      <button @click="deleteNoteEvent(index)">BORRAR</button>
    </div>
  </div>
</template>

<script>
export default {
  name: "ShowNotas",
  props: {
    notas: Array,
  },
  methods: {
    editNoteEvent(index) {
      //Guardando la información de la nota seleccionada
      let data = this.notas[index];
      //Enviando la informacion de la nota a la vista
      this.$emit("editar", data);
    },

    //FUNCION QUE EMITE UN EVENTO PARA BORRAR UNA NOTA
    deleteNoteEvent(index) {
      //Guardando la información de la nota seleccionada
      let data = this.notas[index].id;
      //Enviando la informacion de la nota a la vista
      this.$emit("borrar", data);
    },
  },
};
</script>

<style scoped></style>
