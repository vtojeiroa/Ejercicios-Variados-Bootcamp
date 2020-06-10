<template>
  <div class="home">
    <vue-headful title="Inicio" description="Página de inicio" />
    <!-- MENU -->
    <menucustom></menucustom>
    <!-- TITULO -->
    <h2 v-html="title"></h2>
    <!-- VIDEO -->
    <iframe
      width="704"
      height="396"
      src="https://www.youtube.com/embed/yNCx3RNFCh4"
      frameborder="0"
      allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
      allowfullscreen
    ></iframe>

    <!-- DESCRIPCION -->
    <p v-html="desc"></p>

    <div id="nav">
      <router-link :to="{ name: 'GreekGallery' }">Galeria Griega</router-link>
      <router-link :to="{ name: 'RomanGallery' }">Galeria Romana</router-link>
      <router-link :to="{ name: 'OrientalGallery' }">Galeria Oriental</router-link>
    </div>
    <!-- FOOTER -->
    <footercustom></footercustom>
  </div>
</template>

<script>
// @ is an alias to /src

// IMPORTANDO EL MENÚ
import menucustom from "@/components/MenuCustom.vue";
import footercustom from "@/components/FooterCustom.vue";

export default {
  name: "Home",
  components: {
    //REGISTRANDO EL COMPONENTE
    menucustom,
    footercustom
  },
  data() {
    return {
      title: "Te damos la bienvenida <br> a HACK A MUSEUM",
      desc:
        "Tenemos varias colecciones que te pueden interesar. <br> Buscamos colaboradores/as activamente. 😉"
    };
  }
};
</script>
<style scoped>
#nav {
  padding: 40px;
  display: flex;
  flex-direction: row;
  align-content: center;
  justify-content: center;
}
#nav a {
  font-weight: bold;
  color: sienna;
  margin: 0 1rem;
  text-decoration: none;
  font-size: 1.25rem;
}
</style>