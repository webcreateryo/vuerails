<template>
  <div class="about">
    <v-container>
      <v-row>
        <v-col cols="12">
          <br>
          <br>
<p class="display-3 font-weight-bold">Timer</p>
<br>
<br>
          <p class="headline"><v-icon>mdi-timer</v-icon>ストップウォッチ</p>
        </v-col>
        <v-col cols="12">

            <p class="headline">{{interval.toFixed(2)}}</p>

        <v-btn @click="startTimer()" v-show="!active">Start</v-btn>
        <v-btn @click="stopTimer()" v-show="active">Stop</v-btn>
        <v-btn @click="resetTimer()">Reset</v-btn>
        </v-col>

      </v-row>
<br>
<br>
<v-row>
  <v-col cols="12">
      <p class="headline"><v-icon>mdi-timer</v-icon>時計</p>
    <div class="box">
      <p class="date">{{ year }}/{{ month }}/{{ day }}</p>
      <div class="time">
        <p class="time-item hours">{{ hours }}</p>
        <p class="time-item minutes">{{ minutes }}</p>
        <p class="time-item seconds">{{ seconds }}</p>
      </div>
    </div>
  </v-col>
</v-row>





    </v-container>

  </div>
</template>


<style>
  .box {
  background-color: #dd4b39;
  padding: 2%;
}

.date {
  text-align: right;
  color: #fff;
  font-family: 'Teko', sans-serif;
  font-size: 4rem;
  letter-spacing: .1em;
  margin: .0em 0;
  line-height: 1;
}

.time {
  display: flex;
}

.time-item {
  display: flex;
  justify-content: center;
  align-items: center;
  flex: 1 1;
  height: 100px;
  position: relative;
  z-index: 1;
  padding: 0.5em;
  margin: 3px;
  color: #fff;
  font-family: 'Roboto Mono', monospace;
  font-size: 3rem;
  line-height: 1;
  background-color: #2E2E2E;
  box-sizing: border-box;
}

.time-item:before {
  position: absolute;
  right: 5px;
  bottom: 1px;
  z-index: 1;
  color: #fff;
  font-family: 'Teko', sans-serif;
  font-size: 1.4rem;
  letter-spacing: .05em;
}

.hours:before {
  content: "Hours";
}

.minutes:before {
  content: "Minutes";
}

.seconds:before {
  content: "Seconds";
}
</style>


<script>
  const zeroPadding = (num, digit) => {
  return (Array(digit).join("0") + num).slice(-digit)
}
  export default {
    // name: 'app',
    data () {
      return {
        active : false, // 実行状態
        start : 0, // startを押した時刻
        timer : 0, // setInterval()の格納用
        interval : 0, // 計測時間
        accum : 0, // 累積時間(stopしたとき用)
        date: new Date(),
      }
    },
    methods:{
       startTimer(){
           this.active = true;
           this.start = Date.now();
           this.timer = setInterval(()=>{ this.interval = this.accum + (Date.now() - this.start) * 0.001;}, 10); // 10msごとに現在時刻とstartを押した時刻の差を足す
        },
       stopTimer(){
           this.active = false;
           this.accum = this.interval;
           clearInterval(this.timer);
       },
       resetTimer(){
           this.interval = 0;
           this.accum = 0;
           this.start = Date.now();
       },
       setDate() {
      this.date = new Date()
    }
   },
   computed: {
    year() {
      return this.date.getFullYear()
    },
    month() {
      return zeroPadding(this.date.getMonth() + 1, 2)
    },
    day() {
      return zeroPadding(this.date.getDate(), 2)
    },
    hours() {
      return zeroPadding(this.date.getHours(), 2)
    },
    minutes() {
      return zeroPadding(this.date.getMinutes(), 2)
    },
    seconds() {
      return zeroPadding(this.date.getSeconds(), 2)
    },
  },
  mounted() {
    this.setDate()
    setInterval(() => this.setDate(), 1000)
  }
  }
</script>
