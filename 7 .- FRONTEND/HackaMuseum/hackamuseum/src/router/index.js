import Vue from "vue";
import VueRouter from "vue-router";
import Home from "../views/Home.vue";

Vue.use(VueRouter);

const routes = [
  {
    path: "/",
    name: "Home",
    component: Home,
  },
  {
    path: "/about",
    name: "About",
    component: () =>
      import(/* webpackChunkName: "about" */ "../views/About.vue"),
  },
  {
    path: "/greek-gallery",
    name: "GreekGallery",
    component: () => import("../views/GreekGallery.vue"),
  },
  {
    path: "/roman-gallery",
    name: "RomanGallery",
    component: () => import("../views/RomanGallery.vue"),
  },
  {
    path: "/oriental-gallery",
    name: "OrientalGallery",
    component: () => import("../views/OrientalGallery.vue"),
  },
  {
    path: "/contact",
    name: "Contact",
    component: () => import("../views/Contact.vue"),
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
