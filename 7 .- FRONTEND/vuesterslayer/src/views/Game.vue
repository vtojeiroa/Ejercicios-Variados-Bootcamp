<template>
  <div class="game">
    <!-- BARRAS DE VIDA -->
    <bars :playerHp="playerHp" :enemyHp="enemyHp"></bars>
    <!--   <div class="hpbars">
    <p>Player</p>
    <div class="bar" :style="{width:playerHp + '%'}">
      <p>{{playerHp}}</p>
    </div>
    <p>Enemy</p>
    <div class="bar" :style="{width:enemyHp + '%'}">
      <p>{{enemyHp}}</p>
    </div>-->
    <!-- BARRAS DE VIDA -->

    <!-- CONTROLES -->
    <controls
      :healUses="healUses"
      :specialUses="specialUses"
      v-on:attack="attack"
      v-on:specialAttack="specialAttack"
      v-on:heal="heal"
      v-on:giveUp="giveUp"
    ></controls>
    <!-- CONTROLES -->

    <!-- LOGS -->
    <logs :logs="logs" v-if="logs.length"></logs>
    <!--     <h2>LOGS</h2>
    <p v-for="log in logs" :key="log.id">{{ log.text }}</p>
    -->
    <!-- LOGS -->
  </div>
</template>

<script>
import bars from "@/components/Bars.vue";
import controls from "@/components/Controls.vue";
import logs from "@/components/Logs.vue";

//IMPORTANDO SWEET ALERT 2
import Swal from "sweetalert2";

export default {
  name: "Game",
  components: {
    bars,
    controls,

    logs
  },

  data() {
    return {
      defaultPlayerHp: 80,
      defaultEnemyHp: 80,
      defaultHealUses: 3,
      defaultSpecialUses: 2,
      healHp: 20,
      playerHp: null,
      enemyHp: null,
      healUses: null,
      specialUses: null,

      logs: []
    };
  },
  methods: {
    setDefaultValues() {
      this.playerHp = this.defaultPlayerHp;
      this.enemyHp = this.defaultEnemyHp;
      this.healUses = this.defaultHealUses;
      this.specialUses = this.defaultSpecialUses;
      this.logs = [];
    },

    attack() {
      let damage = this.calculateDamage(3, 10);
      this.enemyHp -= damage;
      this.enemyAttack();

      this.logs.unshift({
        text: `Fighter strikes with ${damage} damage points`
      });
      if (this.logs[2]) {
        this.logs.length = 1;
      }
    },
    calculateDamage(min, max) {
      return Math.max(Math.floor(Math.random() * max) + 1, min);
    },
    enemyAttack() {
      let damage = this.calculateDamage(5, 12);
      this.playerHp -= damage;

      this.logs.unshift({
        text: `Opponent strikes with ${damage} damage points`
      });
      if (this.logs[2]) {
        this.logs.length = 1;
      }
    },
    heal() {
      //CURAR SOLO PUEDE UTILIZARSE SI EL PLAYER ESTÁ A MENOS DEL 50% DE VIDA.
      //CUANDO EL PLAYER SE CURA, EL ENEMIGO ATACA IGUALMENTE
      if (this.playerHp < 40 && this.healUses > 0) {
        this.playerHp += this.healHp;
        this.healUses--;
        this.logs.unshift({
          text: `Fighter recover ${this.healHp} energy points `
        });
        if (this.logs[2]) {
          this.logs.length = 1;
        }

        this.enemyAttack();
      }
    },
    specialAttack() {
      //MOVIMIENTO CON LÍMITES DE USO. NÚMERO BAJO.
      if (this.specialUses > 0) {
        let damage = this.calculateDamage(10, 20);
        this.enemyHp -= damage;
        this.specialUses--;
        this.logs.unshift({
          text: `Special Attack strikes with ${damage} damage points"`
        });
        if (this.logs[2]) {
          this.logs.length = 1;
        }
        this.enemyAttack();
      }
    },
    giveUp() {
      Swal.fire({
        title: "Are you sure ????",
        text: "you won't be a chicken",
        confirmButtonText: "Yes, I am a poor coward",
        showCancelButton: true,
        cancelButtonText: "No!!! I will fight until victory !!!!"
      }).then(result => {
        if (result.value) {
          this.goHome();
        }
      });
    },
    goHome() {
      this.$router.push("/");
    },

    fighterWins() {
      this.enemyHp = 0;
      Swal.fire({
        title: "You are the CHAMPION!!!!!",
        text: "You are the Best!!! Congratulations!!!!!",
        confirmButtonText: "Take your .... 🏆🏆🏆....and Keep Fighting!!!!",
        showCancelButton: true,
        cancelButtonText: "Let me enjoy victory!!!!"
      }).then(result => {
        if (result.value) {
          this.setDefaultValues();
        } else {
          this.goHome();
        }
      });
    },
    fighterLoses() {
      this.playerHp = 0;
      Swal.fire({
        title: "Opponent is the CHAMPION!!!!",
        text: "You're still alive. You want to try again",
        confirmButtonText: "Yes, this time I will win!!!!",
        showCancelButton: true,
        cancelButtonText: "No !!!!, I really am a coward"
      }).then(result => {
        if (result.value) {
          this.setDefaultValues();
        } else {
          this.goHome();
        }
      });
    },
    tie() {
      this.enemyHp = 0;
      this.playerHp = 0;
      Swal.fire({
        title: "You have tied!!!!",
        text: "You want to tie??????",
        confirmButtonText: "Yes, I want!!!!!",
        showCancelButton: true,
        cancelButtonText: "No I'm going to lick my wounds"
      }).then(result => {
        if (result.value) {
          this.setDefaultValues();
        } else {
          this.goHome();
        }
      });
    }
  },
  watch: {
    playerHp() {
      if (this.playerHp <= 0) {
        this.fighterLoses();
      }
    },
    enemyHp() {
      if (this.enemyHp <= 0) {
        if (this.playerHp <= 0) {
          this.tie();
        } else {
          this.fighterWins();
        }
      }
    }
  },
  created() {
    this.setDefaultValues();
  }
};
</script>

<style scoped>
@import url("https://fonts.googleapis.com/css?family=Roboto:400,700&display=swap");
.game {
  height: 900px;
  background-image: url("../assets/img3.jpg");
  background-repeat: no-repeat;
  background-size: cover;
}
</style>
