<template>
  <v-app id="app">
  <Header/>
<!-- ///// -->
<v-main>
  <router-view />
</v-main>








    <!-- ///// -->

<!-- ////footer/ -->



  <v-bottom-navigation
      :value="value"
      color="amber darken-2"
      horizontal dark
    >
      <v-btn to="/">
        <span>Home</span>

        <v-icon style="font-size: 30px;">mdi-home</v-icon>

      </v-btn>


      <v-btn to="/timer">
        <span>Timer</span>
        <v-icon style="font-size: 30px;">mdi-timer</v-icon>
      </v-btn>


      <v-btn to="/system">
        <span>System</span>

        <v-icon style="font-size: 30px;">mdi-web</v-icon>
      </v-btn>
    </v-bottom-navigation>
<!-- ////// -->


</v-app>
</template>

<style lang="scss">
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
}

#nav {
  padding: 30px;

  a {
    font-weight: bold;
    color: #2c3e50;

    &.router-link-exact-active {
      color: #42b983;
    }
  }
}



</style>

<script>
import Header from "./components/Header"; //追記
import axios from 'axios';

const hostName = 'backendrails1.herokuapp.com';  //ローカル:localhost:3000
const path = '/api/tasks'
// import Top from "./components/Top";

// export default {
//   data: function () {
//     return {
//       // message: "Hello Vue!"
//     }
//   },
//   components: {
//     Header, //追記
//
//   }
// }
export default {
  // name: 'app',
  data () {
    return {
      tasks: [],
      newTask: '',
    }
  },
  components: {
    Header,
  },
  methods: {
    getTasks: function() {
      axios.get(`https://${hostName}${path}`) //ローカル :http
        .then((response) => {
          this.tasks = response.data;
        })
        .catch(function(error) {
          console.log(error);
        });
    },
    postTask: function() {
      axios.post(`https://${hostName}${path}`,
          `task[text]=${this.newTask}`
        )
        .then((response) => {
          this.getTasks();
          this.newTask = '';
        })
        .catch(function(error) {
          console.log(error);
        });
    },
    deleteTask: function(id) {
      axios.delete(`https://${hostName}${path}/${id}`)
        .then((response) => {
          this.getTasks();
        })
        .catch(function(error) {
          console.log(error);
        });
    }
  },
  mounted: function() {
    this.getTasks();
  }
}
</script>
