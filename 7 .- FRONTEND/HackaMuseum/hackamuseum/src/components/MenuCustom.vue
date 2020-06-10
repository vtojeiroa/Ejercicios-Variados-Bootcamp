<template>
  <div>
    <div id="nav">
      <router-link :to="{name:'Home' }">Inicio</router-link>|
      <router-link :to="{ name:'About'}">Sobre mí</router-link>
      <router-link :to="{ name:'Contact'}">Contacto</router-link>
    </div>
  </div>
</template>



<script>
export default {
  name: "MenuCustom"
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
#nav {
  padding: 30px;
  display: flex;
  flex-direction: row;
  align-content: center;
  justify-content: center;
  color: white;
}

#nav a {
  font-weight: bold;
  color: #2c3e50;
  margin: 0 0.25rem;
}

#nav a.router-link-exact-active {
  color: #42b983;
}
</style>
