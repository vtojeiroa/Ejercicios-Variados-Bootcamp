<template>
  <div class="error">
    <!-- Uso headful para personalizar el nombre de la página -->
    <vue-headful title="Error" description="Página de Error" />

    <h1>ERROR 404</h1>

    <p>😱 ¿Dónde vas?, esa página no existe</p>
  </div>
</template>

<script>
export default {
  name: "Error"
};
</script>

<style scoped>
p {
  color: turquoise;
  font-size: 2rem;
}
</style>