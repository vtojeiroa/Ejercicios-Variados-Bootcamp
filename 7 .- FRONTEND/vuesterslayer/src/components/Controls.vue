<template>
  <div>
    <p>👇 GAME CONTROLS 👇</p>
    <!-- OPCIONES DEL JUEGO -->
    <div class="options">
      <button @click="attackEvent">
        ATTACK
        <span id="icon">⚔️</span>
      </button>
      <button @click="specialAttackEvent">
        SPECIAL MOVE
        <span id="icon">💣 {{specialUses}}</span>
      </button>
      <button @click="healEvent">
        HEAL
        <span id="icon">💊 {{healUses}}</span>
      </button>
      <button @click="giveUpEvent">
        GIVE UP
        <span id="icon">❌</span>
      </button>
    </div>
    <!-- OPCIONES DEL JUEGO -->
  </div>
</template>

<script>
export default {
  name: "Controls",
  props: {
    healUses: Number,
    specialUses: Number
  },

  methods: {
    attackEvent() {
      this.$emit("attack");
    },
    healEvent() {
      this.$emit("heal");
    },
    specialAttackEvent() {
      this.$emit("specialAttack");
    },
    giveUpEvent() {
      this.$emit("giveUp");
    }
  }
};
</script>
<style scoped>
.options {
  width: 80%;
  padding: 1rem;
  margin: auto;
  margin-top: 1rem;
  display: flex;
  flex-direction: row;
  align-content: center;
  justify-content: center;
}
p {
  font-weight: bolder;
  margin-top: 2rem;
  color: wheat;
  font-size: 2rem;
}

.options button {
  border: 2px solid greenyellow;
  background: slateblue;
  padding: 1rem;
  margin: 0.667rem;
  font-size: 1rem;
  font-weight: bold;
  color: white;
  border-radius: 26px;
  font-weight: bold;
}

.options button:hover {
  background: #008cba;
  color: greenyellow;
  border: 1px solid slateblue;
}
.options button p {
  padding: 0rem;
  margin: 0.667rem;
}
</style>