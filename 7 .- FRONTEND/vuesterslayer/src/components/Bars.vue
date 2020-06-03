<template>
  <div>
    <!-- BARRAS DE VIDA -->
    <div class="hpbars">
      <div class="player">
        <p>FIGHTER</p>
        <div
          class="bar"
          :style="{width:playerHp + '%'}"
          :class="{orange: playerHp<40, red: playerHp<15}"
        >{{playerHp}}</div>
      </div>
      <div class="opponent">
        <p>OPPONENT</p>
        <div
          class="bar"
          :style="{width: enemyHp + '%'}"
          :class="{orange: enemyHp<40,red: enemyHp<15}"
        >{{enemyHp}}</div>
      </div>
    </div>
    <!-- BARRAS DE VIDA -->
  </div>
</template>


<script>
export default {
  name: "Bars",
  props: {
    playerHp: Number,
    enemyHp: Number
  }
};
</script>

<style scoped>
@import url("https://fonts.googleapis.com/css?family=Roboto:400,700&display=swap");
@import url("https://fonts.googleapis.com/css2?family=Acme&display=swap");
.hpbars {
  text-align: center;
  color: #cbcdcd;
  display: flex;
  flex-direction: row;
  align-content: center;
  justify-content: center;
  font-family: "Roboto", serif, sans-serif;
  margin: 0 auto;
  padding: 1rem;
}
.bar {
  color: slateblue;
  font-weight: bold;
  background: greenyellow;
  margin: auto;
  border-radius: 26px;
  height: 40px;
  display: block;
  display: flex;
  justify-content: center;
  align-content: center;
  flex-direction: column;
}
p {
  color: turquoise;
  font-size: 2rem;
  font-weight: bold;
  margin: 2.5rem auto;
  font-family: "Acme", serif, sans-serif;
  text-shadow: 2px 2px black;
}
.player {
  display: flex;
  justify-content: center;
  align-content: center;
  flex-direction: column;
  flex-basis: 50%;
}
.opponent {
  display: flex;
  justify-content: center;
  align-content: center;
  flex-direction: column;
  flex-basis: 50%;
}
.orange {
  background: orange;
}
.red {
  color: yellowgreen;
  background: red;
}
</style>