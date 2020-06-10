<template>
  <div>
    <vue-headful title="OrientalGallery" description="A oriental gallery" />
    <!--  MENU -->
    <menucustom></menucustom>
    <!--  MENU -->

    <!-- TITLE -->
    <h2>{{ title }}</h2>
    <!-- TITLE -->

    <!--IMAGE COLLECTION  -->
    <orientalimages>:orientalImages="orientalImages"</orientalimages>
    <!--     <div class="estatuas">
      <div v-for="item in greekStatues" :key="item.id" class="estatua">
        <p>{{item.name}}</p>
        <p>{{item.photographer}}</p>
        <img :src="item.urlImg" />
      </div>
    </div>-->
    <!--IMAGE COLLECTION  -->
    <!-- FOOTER -->
    <footercustom></footercustom>
    <!-- FOOTER -->
  </div>
</template>

<script>
import menucustom from "@/components/MenuCustom.vue";
import footercustom from "@/components/FooterCustom.vue";
import orientalimages from "@/components/OrientalImages.vue";

export default {
  name: "OrientalGallery",
  components: {
    menucustom,
    footercustom,
    orientalimages,
  },
  data() {
    return {
      title: "COLECCIÓN ORIENTAL",
    };
  },
};
</script>

<style scoped></style>
