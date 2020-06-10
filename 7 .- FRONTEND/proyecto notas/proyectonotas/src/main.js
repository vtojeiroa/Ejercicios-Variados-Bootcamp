import Vue from "vue";
import App from "./App.vue";
import router from "./router";

//IMPORTO VUE-HEADFUL
import vueHeadful from "vue-headful";
Vue.component("vue-headful", vueHeadful);

Vue.config.productionTip = false;

new Vue({
  router,
  render: (h) => h(App),
}).$mount("#app");
