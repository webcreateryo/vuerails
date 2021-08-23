<template>
  <div class="home">


<div class="formzone">
  <v-container>
    <div class="d-flex justify-start">
    <p class="display-3 headcolor">Today's doing!</p>
    </div>
    <br>

      <v-form v-on:submit.prevent="postTask" class="formbg" dark>
            <v-text-field id="new-task-form" type="text" v-model="newTask" placeholder="今日やること..." color="amber darken-2" light></v-text-field>
            <div class="d-flex justify-end">
      <v-btn v-on:click.prevent='postTask()' color="amber darken-2" dark x-large class="font-weight-bold">▶︎</v-btn>
            </div>

          </v-form>

    </v-container>
<br>
</div>

<!-- ///////// -->



<br>
<br>
<br>

<div class="listzone">
  <v-container>
    <div class="d-flex justify-start">
    <p class="display-2"> Todo list</p>
    </div>
    <br>

        <v-list>
          <v-col col="12">

          <v-card class="pt-3 pb-3">
                    <v-list-item class="d-flex" v-for="task in tasks" :key="task.id">

                      <v-row>
                        <v-col cols="1">
                          <v-icon
                                large
                                color="amber darken-2"
                              >
                                mdi-message-text
                              </v-icon>


                          </v-col>
                        <v-col cols="3">
                          <p class="text-left">{{ task.created_at }}</p>
                          </v-col>
                        <v-col cols="4">
                          <v-list-item-title class="text-left headline">{{ task.text }}</v-list-item-title>

                          </v-col>
                        <v-col cols="4">
                          <v-btn class="font-weight-bold"
                          v-on:click="deleteTask(task.id)" dark color="amber darken-2">DELETE</v-btn>
                          </v-col>
                      </v-row>


                    </v-list-item>
    </v-card>
    </v-col>
        </v-list>
  </v-container>

</div>




<!-- ///// -->







  </div>
</template>

<style>
  .logosize {
    width: 20%;
  }

  .formzone {
    background-color: #dd4b39;
  }

  .headcolor {
    color: #fff;
  }

  .formbg {
    background-color: #dd4b39;
    color: #fff !important;
  }




</style>


<script>
// @ is an alias to /src
// import HelloWorld from "@/components/HelloWorld.vue";
import axios from 'axios';

const hostName = 'backendrails1.herokuapp.com'; //ローカル:localhost:3000
const path = '/api/tasks'

export default {
  // name: 'app',
  data () {
    return {
      tasks: [],
      newTask: '',
      fab: false,
    }
  },
  methods: {
    getTasks: function() {
      axios.get(`https://${hostName}${path}`) //ローカル
        .then((response) => {
          this.tasks = response.data;
        })
        .catch(function(error) {
          console.log(error);
        });
    },
    postTask: function() {
      axios.post(`https://${hostName}${path}`,  //ローカル
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
      axios.delete(`https://${hostName}${path}/${id}`)  //ローカル
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
