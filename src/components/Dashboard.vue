<template>
  <div id="candidato-table" v-if="candidatos">
    <div>
      <div id="candidato-table-heading">
        <div class="order-id">ID</div>
        <div>Nome:</div>
        <div>Contato:</div>
        <div>Habilidade(s):</div>
        <div>Data de Contratação:</div>
        <div>Situação:</div>
      </div>
    </div>
    <div id="candidato-table-rows">
      <div
        class="candidato-table-row"
        v-for="candidato in candidatos"
        :key="candidato.id"
      >
        <div class="order-number">{{ candidato.id }}</div>
        <div>{{ candidato.nome }}</div>
        <div>{{ candidato.contato }}</div>
        <div>{{ candidato.habilidades }}</div>
        <div>{{ candidato.contratacao_data }}</div>
        <div>{{ candidato.status }}</div>
        <div>
          <router-link :to="'/editar/' + candidato.id">
            <button class="delete-btn">Editar</button>
          </router-link>
        </div>
      </div>
    </div>
  </div>
  <div v-else>
    <h2>Não há candidatos no momento!</h2>
  </div>
</template>
<script>
export default {
  name: "Dashboard",
  data() {
    return {
      candidatos: null,
      candidato_id: null,
      status: [],
    };
  },
  methods: {
    async getCandidato() {
      const req = await fetch("http://localhost:8081/api/candidato");

      const data = await req.json();

      this.candidatos = data;
    }
  },
  mounted() {
    this.getCandidato();
  },
};
</script>

<style scoped>
#candidato-table {
  max-width: 1200px;
  margin: 0 auto;
}

#candidato-table-heading,
#candidato-table-rows,
.candidato-table-row {
  display: flex;
  flex-wrap: wrap;
}

#candidato-table-heading {
  font-weight: bold;
  padding: 12px;
  border-bottom: 3px solid #333;
}

.candidato-table-row {
  width: 100%;
  padding: 12px;
  border-bottom: 1px solid #ccc;
}

#candidato-table-heading div,
.candidato-table-row div {
  width: 15.8%;
}

#candidato-table-heading .order-id,
.candidato-table-row .order-number {
  width: 5%;
}

select {
  padding: 12px 6px;
  margin-right: 12px;
}

.delete-btn {
  background-color: #222;
  color: #f3f3f3;
  font-weight: bold;
  border: 2px solid #222;
  padding: 10px;
  font-size: 16px;
  margin: 0 auto;
  cursor: pointer;
  transition: 0.5s;
}

.delete-btn:hover {
  background-color: transparent;
  color: #2C3E50;
}
</style>