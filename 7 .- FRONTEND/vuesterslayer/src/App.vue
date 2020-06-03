<template>
  <div id="app">
    <div id="nav">
      <router-link :to="{ name: 'Home' }">Home</router-link>
      <router-link :to="{ name: 'About' }">About</router-link>
    </div>
    <router-view />
  </div>
</template>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
}

#nav {
  padding: 5px;
}

#nav a {
  margin: 0 0.75rem;
  font-weight: bold;
  color: #2c3e50;
}

#nav a.router-link-exact-active {
  color: turquoise;
}

body {
  height: 900px;
  background-image: url("assets/img1.jpeg");
  background-repeat: no-repeat;
  background-origin: content-box;
  background-size: cover;
}
</style>
