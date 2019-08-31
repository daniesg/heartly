import Vue from 'vue/dist/vue.esm'
import Vuelidate from 'vuelidate';
import 'bootstrap/js/dist/tooltip';

Vue.use(Vuelidate);

Vue.mixin({
  mounted: function () {
    $(this.$el).find('[data-toggle="tooltip"]').tooltip();
  }
});

export default Vue;
