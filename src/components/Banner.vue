<template>
  <div id="main-banner">
    <h1>Aplicação para Devs Recrutadores</h1>
  </div>
</template>

<script>
  export default {
    name: "Banner"
  }
</script>

<style scoped>

  #main-banner {
    background-image: url('/public/img/wp3.png');
    background-position: 0 -100px;
    background-size: cover;
    height: 550px;
    display: flex;
    align-items: center;
    justify-content: flex-start;
  }

  #main-banner h1 {
    color: #FFF;
    text-align: center;
    font-size: 60px;
    background-color: #222;
    padding: 20px 40px;
  }

</style>