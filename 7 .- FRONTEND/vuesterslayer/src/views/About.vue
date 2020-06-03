<template>
  <div class="about">
    <h1>¡Hey!👋</h1>
    <img src="../assets/fotoVictor.jpg" alt="Imagen de Víctor" title="Imagen de Víctor" />
    <p>
      This proyect has been created by
      <a
        href="https://www.linkedin.com/in/vtojeiroa"
        target="_blank"
      >Víctor Tojeiro</a>
    </p>
  </div>
</template>

<script>
export default {
  name: "About"
};
</script>

<style scoped>
.about {
  min-height: 100vh;
  color: white;
}
a {
  color: turquoise;
}
img {
  border-radius: 50%;
  max-width: 200px;
  max-height: 200px;
}
</style>