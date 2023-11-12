<template>
  <div>
    <Message :msg="msg" v-show="msg" />
    <form id="candidato-form" method="PUT" @submit="updateCandidato">
      <div class="input-container">
        <label for="nome">Nome do candidato:</label>
        <input
          type="text"
          id="nome"
          name="nome"
          v-model="nome"
          placeholder="Digite o seu nome"
        />
      </div>

      <div class="input-container">
        <label for="contato">Contato do candidato:</label>
        <input
          type="text"
          id="contato"
          name="contato"
          v-model="contato"
          placeholder="Digite o seu contato"
        />
      </div>

      <div class="input-container">
        <label for="habilidades">Habilidades do candidato:</label>
        <input
          type="text"
          id="habilidades"
          name="habilidades"
          v-model="habilidades"
          placeholder="Digite suas habilidades" 
        />
      </div>

      <div class="input-container2" style="">
        <router-link :to="'/'">
          <button class="submit-btn">Voltar</button>
        </router-link>

        <div class="input-container">
          <input class="submit-btn" type="submit" value="Atualizar" />
        </div>
        
        <div class="input-container" v-show="status != 'Contratado'">
          <input class="submit-btn" @click="contratar()" value="Contratar" />
        </div>

        <router-link :to="'/'" @click="deleteCandidato()">
          <button class="submit-btn">Excluir</button>
        </router-link>
      </div>
    </form>
  </div>
</template>

<script>
import Message from "./Message";

export default {
  name: "EditCandidate",
  data() {
    return {
      candidato: null,
      nome: null,
      contato: null,
      habilidades: null,
      status: null,
      msg: null,
    };
  },
  methods: {
    async getCandidato() {
      const url =
        "http://localhost:8081/api/candidato/" + this.$route.params.id;

      const req = await fetch(url);
      const data = await req.json();

      this.candidato = data;

      this.nome = this.candidato.nome;
      this.contato = this.candidato.contato;
      this.habilidades = this.candidato.habilidades;
      this.status = this.candidato.status;
    },

    async updateCandidato() {
      const dataJson = JSON.stringify({
        id: this.candidato.id,
        nome: this.nome,
        contato: this.contato,
        habilidades: this.habilidades,
        status: this.candidato.status,
        contratacao_data: this.candidato.contratacao_data,
      });

      const req = await fetch(`http://localhost:8081/api/candidato`, {
        method: "PUT",
        headers: { "Content-Type": "application/json" },
        body: dataJson,
      });

      const res = await req.json();
      console.log(res);

      this.msg = "Cadastro atualizado com sucesso!";
      setTimeout(() => (this.msg = ""), 3000);
    },
    async deleteCandidato() {
      const id = this.$route.params.id;
      const req = await fetch(`http://localhost:8081/api/candidato/${id}`, {
        method: "DELETE",
      });

      const res = await req.json();
      this.getPedidos();
    },
    async contratar() {
      const hoje = new Date();
      const dia = hoje.getDate().toString().padStart(2, "0");
      const mes = String(hoje.getMonth() + 1).padStart(2, "0");
      const ano = hoje.getFullYear();
      const dataAtual = `${dia}/${mes}/${ano}`;

      const dataJson = JSON.stringify({
        id: this.candidato.id,
        nome: this.nome,
        contato: this.contato,
        habilidades: this.habilidades,
        status: "Contratado",
        contratacao_data: dataAtual,
      });

      const req = await fetch(`http://localhost:8081/api/candidato`, {
        method: "PUT",
        headers: { "Content-Type": "application/json" },
        body: dataJson,
      });

      const res = await req.json();
      console.log(res);

      this.msg = "Candidato contratado sucesso!";
      setTimeout(() => (this.msg = ""), 3000);
    },
  },
  mounted() {
    this.getCandidato();
  },
  components: {
    Message,
  },
};
</script>


<style scoped>
#candidato-form {
  max-width: 400px;
  margin: 0 auto;
}

.input-container {
  display: flex;
  flex-direction: column;
  margin-bottom: 20px;
}

.input-container2 {
  display: flex;
  flex-direction: row;
  justify-content: space-around;
  gap: 10px;
  margin-bottom: 20px;
}

label {
  font-weight: bold;
  margin-bottom: 15px;
  color: #222;
  padding: 5px 10px;
  border-left: 4px solid #2C3E50;
}

input {
  padding: 5px 10px;
  width: 300px;
}

#opcionais-container {
  flex-direction: row;
  flex-wrap: wrap;
}

#opcionais-title {
  width: 100%;
}

.submit-btn {
  background-color: #222;
  color: #2C3E50;
  font-weight: bold;
  border: 2px solid #222;
  padding: 10px;
  font-size: 16px;
  margin: 0 auto;
  cursor: pointer;
  transition: 0.5s;
  width: 100px;
}

.submit-btn:hover {
  background-color: transparent;
  color: #222;
}
</style>