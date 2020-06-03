<template>
  <div class="message">
    <button @click="resetEvent">Reset</button>
  </div>
</template>

<script>
export default {
  name: "Reset",
  methods: {
    resetEvent() {
      this.$emit("reset");
    }
  }
};
</script>

<style scoped>
.message {
  margin: 0 auto;
}
p {
  font-size: 2rem;
  color: gold;
  font-weight: 900;
  margin: 0.5rem;
}
button {
  width: 150px;
  cursor: pointer;
  text-align: center;
  font-size: 1rem;
  color: white;
  border: 1px solid white;
  border-radius: 6px;
  background: gray;
  padding: 1rem;
  margin: 0.667rem;
  font-weight: bold;
  box-shadow: 10px 10px 5px -2px rgba(0, 0, 0, 0.5);
}
button:hover {
  background-color: #008cba;
  color: white;
  border: 1px solid gray;
}
</style>