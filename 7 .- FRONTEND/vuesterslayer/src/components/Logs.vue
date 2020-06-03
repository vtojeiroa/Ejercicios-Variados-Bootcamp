<template>
  <div class="logs">
    <h2>FIGHT LOGS</h2>
    <P class="log" v-for="log in logs" :key="log.id">{{ log.text }}</P>
  </div>
</template>

<script>
export default {
  name: "Logs",
  props: { logs: Array }
};
</script>

<style scoped>
@import url("https://fonts.googleapis.com/css?family=Roboto:400,700&display=swap");
.logs {
  display: inline-block;
  text-align: center;
  color: white;
  font-weight: bold;
  font-size: 1rem;
  margin: 8rem 0.5rem;
  padding: 0.5rem;
  border: 2px solid greenyellow;
  background: slateblue;
  border-radius: 20px;
  width: 25%;
}
.register {
  font-family: "Roboto", serif, sans-serif;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-content: center;
  margin: 0 auto;
  width: 40%;
}
.log {
  display: inline-block;
  text-align: center;
  color: turquoise;
  font-weight: bold;
  font-size: 1rem;
  margin: 0.2rem 0.5rem;
  padding: 0.5rem;
  border: 2px solid greenyellow;
  border-radius: 20px;
  width: 50%;
}
</style>
