<template>
  <div>
    <vue-headful title="RomanGallery" description="A roman gallery" />
    <!--  MENU -->
    <menucustom></menucustom>
    <!--  MENU -->

    <!-- TITLE -->
    <h2>{{ title }}</h2>
    <!-- TITLE -->

    <!--IMAGE COLLECTION  -->
    <romanimages>:romanImages="romanImages"</romanimages>
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
import romanimages from "@/components/RomanImages.vue";

export default {
  name: "RomanGallery",
  components: {
    menucustom,
    footercustom,
    romanimages,
  },
  data() {
    return {
      title: "COLECCIÓN ROMANA",
    }; /*,
       romanStatues: [
        {
          name: "Estatua 1",
          photographer: "Mary",
          urlImg:
            "https://images.unsplash.com/photo-1549887534-1541e9326642?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60"
        },
        {
          name: "Estatua 2",
          photographer: "Jessica",
          urlImg:
            "https://images.unsplash.com/photo-1574352067721-72d5913bd35c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60"
        },
        {
          name: "Estatua 3",
          photographer: "Sarah",
          urlImg:
            "https://images.unsplash.com/photo-1549887552-cb1071d3e5ca?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60"
        },
        {
          name: "Estatua 4",
          photographer: "Louise",
          urlImg:
            "https://images.unsplash.com/photo-1572379371012-9e11bfc61b35?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60"
        }
      ]
    };*/
  },
};
</script>

<style scoped></style>
