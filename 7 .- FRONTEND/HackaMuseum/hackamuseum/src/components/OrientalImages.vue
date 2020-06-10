<template>
  <div>
    <div class="estatuas">
      <div v-for="item in orientalStatues" :key="item.id" class="estatua">
        <p>{{ item.name }}</p>
        <p>{{ item.photographer }}</p>
        <img :src="item.urlImg" />
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "orientalImages",

  data() {
    return {
      orientalStatues: [
        {
          name: "Estatua 1",
          photographer: "Mary",
          urlImg:
            "https://images.unsplash.com/photo-1549887534-1541e9326642?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
        },
        {
          name: "Estatua 2",
          photographer: "Jessica",
          urlImg:
            "https://images.unsplash.com/photo-1574352067721-72d5913bd35c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
        },
        {
          name: "Estatua 3",
          photographer: "Sarah",
          urlImg:
            "https://images.unsplash.com/photo-1549887552-cb1071d3e5ca?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
        },
        {
          name: "Estatua 4",
          photographer: "Louise",
          urlImg:
            "https://images.unsplash.com/photo-1572379371012-9e11bfc61b35?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
        },
      ],
    };
  },
};
</script>

<style scoped></style>
