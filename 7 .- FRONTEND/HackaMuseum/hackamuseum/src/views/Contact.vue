<template>
  <div>
    <vue-headful title="Contacto" description="Página de contacto del museo" />

    <menucustom></menucustom>
    <h1>CONTACTA CON NOSOTROS</h1>
    <P>Para realizar cualquier consulta o sugerencia, rellena y envia el cuestionario</P>
    <!-- FORMULARIO
    <form>-->
    <!-- NOMBRE
      <label for="name">Nombre</label>
      <br />
      <input name="name" type="text" placeholder="Tu nombre" />
    <br />-->
    <!-- ASUNTO 

      <label for="subject">Asunto del mensaje</label>
      <br />
      <input name="subject" type="text" placeholder="El asunto" />
    <br />-->

    <contactform>:contactform="contactform"</contactform>
    <!-- MENSAJE 
      <label for="textarea">Tu mensaje</label>
      <br />
    <textarea name="textarea" id="textarea" cols="50" rows="4"></textarea>-->
    <!-- BOTONES 
      <br />

      <button @click="cancelEvent">Cancelar</button>
      <button @click="sendEvent">Enviar</button>
    </form>-->
    <!-- /FORMULARIO -->

    <footercustom></footercustom>
  </div>
</template>

<script>
import menucustom from "@/components/MenuCustom.vue";
import footercustom from "@/components/FooterCustom.vue";
import contactform from "@/components/ContactForm.vue";
export default {
  name: "Contact",
  components: {
    menucustom,
    footercustom,
    contactform
  }
  /* methods: {
    sendEvent() {
      this.$emit("Enviar");
      return alert("Enviado");
    },
    cancelEvent() {
      this.$emit("Cancelar");
      return alert("Cancelado");
    },
  }, */
};
</script>

<style scoped>
/* div {
  background: #404040;
  margin: 0 auto;
  height: 100vh;
  color: white;
  display: flex;
  flex-direction: column;
}
.contactform {
  margin-bottom: 5rem;
} */
</style>
