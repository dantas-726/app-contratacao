<template>
  <div>
    <div class="main-container">
      <h1>Cadastrar candidatos:</h1>
      <CandidateForm />
    </div>
  </div>
</template>

<script>
import CandidateForm from "../components/CandidateForm";

export default {
  name: "Pedidos",
  components: {
    CandidateForm,
  },
};
</script>
