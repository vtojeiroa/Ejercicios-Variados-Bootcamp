<template>
  <div>
    <h2>Haz Logín</h2>
    <input type="text" placeholder="Escribe tu usuario" v-model="usuario" />
    <input
      type="password"
      placeholder="Escribe tu contraseña"
      v-model="password"
    />
    <button @click="login()">HAZ LOGIN</button>
  </div>
</template>

<script>
import { loginUser } from "../api/utils";

export default {
  name: "Login",
  data() {
    return {
      usuario: "",
      password: "",
    };
  },
  methods: {
    async login() {
      try {
        //INTENTO HACER LOGIN
        await loginUser(this.usuario, this.password);
        //SI HAY LOGIN, QUE ME LLEVE AL HOME
        this.$router.push("/home");
      } catch (err) {
        alert(`Error:${err}`);
      }
    },
  },
};
</script>

<style scoped></style>
