<template>
  <div class="about">
    <v-container>
      <br>
      <br>
<p class="display-3 font-weight-bold">System</p>
<br>
<br>
      <v-row class="flex-row-reverse">
        <v-col cols="12" xl="12" md="12" lg="6">
          <v-img src="system_img001.png" class="systemimg"></v-img>
        </v-col>
<v-col cols="12" xl="12" md="12" lg="6">
  <p class="headline font-weight-bold text-left">開発環境</p>
<p>開発環境は<span class="font-weight-bold">Docker</span>を使用し、ディレクトリをバックエンド、
  フロントエンドに分け、ローカルホストでも別々のポートで開発しました。
  バックエンドには<span class="font-weight-bold">Rails6</span>、
  フロントエンドには<span class="font-weight-bold">Vue.js</span>を使用し、
  Vue.jsのデザインフレームワークの<span class="font-weight-bold">Vuetify</span>を導入しております。
</p>
  </v-col>


        </v-row>

      <v-row class="flex-row-reverse">
        <v-col cols="12" xl="12" md="12" lg="6">
          <v-img src="system_img002.png" class="systemimg"></v-img>
        </v-col>
<v-col cols="12" xl="12" md="12" lg="6">
  <p class="headline font-weight-bold text-left">本番環境</p>
<p>本番環境は<span class="font-weight-bold">Heroku</span>を使用し、ディレクトリをバックエンド、
  フロントエンドに分け、ローカルホストでも別々のポートで開発しました。
  バックエンドには<span class="font-weight-bold">Rails6</span>、
  フロントエンドには<span class="font-weight-bold">Vue.js</span>を使用し、
  Vue.jsのデザインフレームワークの<span class="font-weight-bold">Vuetify</span>を導入しております。
</p>
  </v-col>


        </v-row>
<br>
<br>
    </v-container>
  </div>
</template>

<style>
  .systembox {
    width: 100%;
  }


</style>
