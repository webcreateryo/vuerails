<template>
  <header id="header">


    <v-app-bar
       app
       color="#dd4b39"
       flat
       fixed
       absolute
     >
       <v-app-bar-nav-icon @click="drawer = true" color="white"></v-app-bar-nav-icon>
       <!-- <v-toolbar-title color="white">MyPortfolioSite</v-toolbar-title> -->
     </v-app-bar>
     <!-- ここから -->
     <v-navigation-drawer
       v-model="drawer"
       fixed
       temporary
     >
       <v-list
         nav
       >
         <v-list-item-group>
           <v-list-item>
             <v-list-item-title><router-link to="/" class="routerclass">Home</router-link> </v-list-item-title>
           </v-list-item>
           <v-list-item>
             <v-list-item-title><router-link to="/timer" class="routerclass">Timer</router-link></v-list-item-title>
           </v-list-item>
           <v-list-item>
             <v-list-item-title><router-link to="/system" class="routerclass">System</router-link></v-list-item-title>
           </v-list-item>
           <v-list-item>
             <v-list-item-title><router-link to="/weather" class="routerclass">Weather</router-link></v-list-item-title>
           </v-list-item>
         </v-list-item-group>
       </v-list>
     </v-navigation-drawer>

  </header>
</template>

<style>
#header {
  background-color: #dd4b39;
}

.routerclass {
  text-decoration: none;
  color: #dd4b39 !important;
  font-weight: bold;
  width: 100%;
}

.routerhover:hover {
  color: #FFA000 !important;

}

</style>



<script>
export default {
  name: "Header",
  data: () => ({
      drawer: false,
      group: null,
    }),
};
</script>
