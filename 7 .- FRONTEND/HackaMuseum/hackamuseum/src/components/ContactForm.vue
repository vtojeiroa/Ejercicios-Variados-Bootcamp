<template>
  <div>
    <!-- FORMULARIO -->
    <form>
      <!-- NOMBRE -->
      <label for="name">Nombre</label>
      <br />
      <input name="name" type="text" placeholder="Tu nombre" />
      <br />
      <!-- ASUNTO -->

      <label for="subject">Asunto del mensaje</label>
      <br />
      <input name="subject" type="text" placeholder="El asunto" />
      <br />
      <!-- MENSAJE -->
      <label for="textarea">Tu mensaje</label>
      <br />
      <textarea name="textarea" id="textarea" cols="50" rows="4"></textarea>
      <!-- BOTONES -->
      <br />
      <div class="button">
        <button @click="cancelEvent">Cancelar</button>
        <button @click="sendEvent">Enviar</button>
      </div>
    </form>
    <!-- /FORMULARIO -->
  </div>
</template>

<script>
export default {
  name: "contactForm",
  components: {},
  methods: {
    sendEvent() {
      this.$emit("Enviar");
      return alert("Enviado");
    },
    cancelEvent() {
      this.$emit("Cancelar");
      return alert("Cancelado");
    }
  }
};
</script>

<style scoped>
* {
  box-sizing: border-box;
}
form {
  display: flex;
  flex-direction: column;
  margin: 0 auto;
  width: 30%;
}
label {
  text-align: left;
  margin: 0.5rem 0;
}
input,
textarea {
  padding: 0.5rem;
  margin: 0.25rem 0;
  border: 1px solid gray;
  border-radius: 2 px;
}
.buttons {
  display: flex;
  flex-direction: row;
  justify-content: center;
  margin: 2rem 0;
}
.button {
  display: flex;
  justify-content: center;
}

button {
  width: 20%;
  cursor: pointer;
  text-align: center;
  font-size: 1rem;
  background: gray;
  color: black;
  border: 2px solid #d6cdb6;
  border-radius: 2px;
  padding: 0.5rem;
  margin: 0.667rem;
  font-weight: bold;
  box-shadow: 10px 10px 5px -2px rgba(0, 0, 0, 0.5);
}
/* button:hover {
  background-color: slateblue;
  color: white;
  border: 2px solid black; 
}*/
button:focus {
  outline: none;
}
</style>
