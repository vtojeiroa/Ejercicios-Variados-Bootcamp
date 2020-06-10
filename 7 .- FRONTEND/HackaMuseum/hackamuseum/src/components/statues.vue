 
<template>
  <div>
    <!-- COLECCIÓN DE IMAGENES -->
    <div class="statues">
      <div v-for="item in statues" class="statue" :key="item.id">
        <p>
          <img :src="item.urlImage" :alt="item.name" />
        </p>
        <p>{{item.photographer}}</p>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "statues",
  props: {
    statues: Array
  }
};
</script>

<style scoped>
.statues {
  display: flex;
  flex-direction: row;
  align-content: center;
  justify-content: center;
  margin-bottom: 3rem;
}
.statue img {
  margin: 1rem;
  height: 400px;
  max-width: 400px;
}
</style>