<template>
  <div class="home">
    <p>{{ speak }}</p>
    <input type="text" v-show="this.dialogs[this.dialog].askName" v-model="playerName" />
    <button @click="changeDialog()" v-show="this.dialogs[this.dialog].game">COME ON!!!</button>
    <button v-show="!this.dialogs[this.dialog].game">
      <router-link :to="{ name: 'Game' }">GO FIGHT!!!!!</router-link>
    </button>
  </div>
</template>

<script>
// @ is an alias to /src
export default {
  name: "Home",
  data() {
    return {
      playerName: "",
      dialog: 0,
      dialogs: [
        {
          text:
            "We are on the 30th Anniversary of the Street Fighter Championship!!!",
          dialog: 0,
          game: true
        },
        {
          text: "You have trained very hard to be the champion!!!",
          dialog: 1,
          game: true
        },
        {
          text: "What`s the name of the new champion!!!",
          dialog: 2,
          game: true,
          askName: true
        },
        {
          text: "The time has come to prove it!!!",
          dialog: 3,
          game: false
        }
      ]
    };
  },
  computed: {
    speak() {
      if (this.playerName) {
        this.dialogs[3].text = `Come on ${this.playerName}!!!!!! Prove you're the best!!!! `;
      }

      return this.dialogs[this.dialog].text;
    }
  },

  methods: {
    changeDialog() {
      this.dialog++;
    }
  }
};
</script>
<style scoped>
@import url("https://fonts.googleapis.com/css?family=Roboto:400,700&display=swap");

body {
  height: 900px;
  background-image: url("../assets/img1.jpeg");
  background-repeat: no-repeat;
  background-origin: content-box;
  background-size: cover;
}
p {
  padding-top: 10rem;
  font-family: "Roboto", serif, sans-serif;
  font-weight: bolder;
  font-size: 4rem;
  color: greenyellow;
  text-shadow: 2px 2px black;
}
button {
  padding: 0.5rem;
  font-family: "Roboto", serif, sans-serif;
  font-weight: bolder;
  font-size: 1rem;
  background: greenyellow;
  color: turquoise;
  border-radius: 20px;
  border: 2px solid turquoise;
  width: 200px;
  height: 100px;
  text-shadow: 2px 2px black;
}
button a {
  color: turquoise;
  font-size: 2rem;
}
input {
  padding: 0.6rem;
  font-size: 1rem;
  border: 2px solid turquoise;
}
</style>
