import Vue from "vue";
import VueRouter from "vue-router";
import Notas from "../views/Notas.vue";

Vue.use(VueRouter);

const routes = [
  {
    path: "/",
    name: "Notas",
    component: Notas,
  },
  {
    path: "/about",
    name: "About",
    component: () =>
      import(/* webpackChunkName: "about" */ "../views/About.vue"),
  },
  {
    path: "*",
    name: "Error",
    component: () => import("../views/Error.vue"),
  },
];

const router = new VueRouter({
  routes,
});

export default router;
