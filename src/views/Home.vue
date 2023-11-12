<template>
  <div>
    <Banner />
    <div class="main-container">
      <h1>Gerenciar candidatos:</h1>
      <Dashboard />
    </div>
  </div>
</template>

<script>
import Banner from '../components/Banner'
import Dashboard from '../components/Dashboard'

export default {
  name: 'Home',
  components: {
    Banner,
    Dashboard
    
  }
}
</script>