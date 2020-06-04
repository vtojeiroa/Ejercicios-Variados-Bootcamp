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
@import url("https://fonts.googleapis.com/css?family=Roboto:400,700&display=swap");
.about {
  min-height: 100vh;
  color: white;
  font-family: "Roboto", serif, sans-serif;
}
h1 {
  color: greenyellow;
  font-size: 3rem;
  text-shadow: 2px 2px black;
}
a {
  color: greenyellow;
  font-weight: bolder;
  text-shadow: 2px 2px black;
}

p {
  color: turquoise;
  font-weight: bolder;
  text-shadow: 2px 2px black;
}
img {
  border-radius: 50%;
  max-width: 200px;
  max-height: 200px;
}
</style>