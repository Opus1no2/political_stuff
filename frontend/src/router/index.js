import Vue from 'vue';
import Router from 'vue-router';
import Senators from '@/components/Senators';
import Senator from '@/components/Senator';
import About from '@/components/About';

Vue.use(Router);

export default new Router({
  routes: [
    {
      path: '/',
      name: 'Senators',
      component: Senators,
    }, {
      path: '/about',
      name: 'About',
      component: About,
    }, {
      path: '/senator/:id/',
      name: 'Senator',
      component: Senator,
    },
  ],
});
