<template>
  <div class="weather">
    <v-container class="d-flex justify-center">

  <v-list>
    <br>
    <br>
    <p class="display-3 font-weight-bold">福岡県の天気</p>
    <br>
    <br>
    <v-list-item v-for="item in items" :key="item.id" width="100%">
      <v-card class="pl-3 pr-3 pt-3 pb-3 mt-5" width="370px">
        <v-row>
          <v-col cols="3" >
            <p v-if="item.weather[0].main == 'Rain'"><img src="https://openweathermap.org/img/w/10d.png" alt="Rainy"></p>
 <p v-else-if="item.weather[0].main == 'Clouds'"><img src="https://openweathermap.org/img/w/04n.png" alt="Cloudy"></p>
 <p v-else-if="item.weather[0].main == 'Clear'"><img src="https://openweathermap.org/img/w/01d.png" alt="Sunny"></p>
 <p v-else><img src="img/sunset.jpg" alt="Sunset"></p>
  <p class="text-h6 font-weight-bold">{{item.weather[0].description}}</p>

            </v-col>
          <v-col cols="3">
            <p class="text-h3" style="color: red;">{{item.main.temp | roundUp}}<span class="text-caption">℃</span></p>

            </v-col>
          <v-col cols="3">
            <p class="text-caption">湿度:{{item.main.humidity}}%</p>
            <p class="text-caption">風速:{{item.wind.speed | roundUp}}m/s</p>


            </v-col>
          <v-col cols="3">
            <p class="text-h6 font-weight-bold">福岡県</p>
            <p class="text-h6">{{item.dt_txt |timeAction}}</p>

            </v-col>
          </v-row>
  </v-card>
    </v-list-item>
  </v-list>


</v-container>


    </div>
</template>

<style>



</style>


<script>
// @ is an alias to /src
// import HelloWorld from "@/components/HelloWorld.vue";
import axios from 'axios';
import moment from "moment";


export default {
  // name: 'app',
  data () {
    return {
      items: []
    }
  },
  methods: {
    getTasks: function() {
      axios.get(`https://api.openweathermap.org/data/2.5/forecast?q=Fukuoka&appid=fd4e0f8cb89542cd611b6b6decd1f971&lang=ja&units=metric`) //ローカル
        .then((response) => {
          this.items = response.data.list;
        })
        .catch(function(error) {
          console.log(error);
        });
    },
},
mounted: function() {
  this.getTasks();
},
filters: {
  roundUp(value){
    return Math.ceil(value)
  },
  timeAction(value) {
            return moment(value).format('M/DD HH時');
  }
}
}
</script>
