<template>
  <div>
    <div class="main-container">
      <h1>Editar candidatos:</h1>
       <EditCandidate />
    </div>
  </div>
</template>

<script>
import EditCandidate from '../components/EditCandidate'

export default {
  name: 'Edit',
  components: {
    EditCandidate
    
  }
}
</script>