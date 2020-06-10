<template>
  <div class="about">
    <vue-headful title="Sobre mí" description="Página sobre mí" />
    <menucustom></menucustom>

    <h1>¡¡¡Hola Chic@!!!👋👋👋</h1>
    <img src="../assets/fotoVictor.jpg" alt="Imagen de Víctor" title="Imagen de Víctor" />
    <p>
      Este proyecto ha sido creado por
      <a
        href="https://www.linkedin.com/in/vtojeiroa"
        target="_blank"
      >Víctor Tojeiro</a>
    </p>

    <footercustom></footercustom>
  </div>
</template>
<script>
// @ is an alias to /src

// IMPORTANDO EL MENÚ
import menucustom from "@/components/MenuCustom.vue";
import footercustom from "@/components/FooterCustom.vue";

export default {
  name: "About",
  components: {
    //REGISTRANDO EL COMPONENTE
    menucustom,
    footercustom
  }
};
</script>


<style scoped>
.about {
  height: 100vh;
}
h1,
p {
  color: blue;
}

img {
  width: 200px;
  border-radius: 40%;
}
</style>