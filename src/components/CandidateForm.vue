<template>
  <div>
    <Message :msg="msg" v-show="msg" />
    <form id="candidato-form" method="POST" @submit="createCandidato">
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

      <div class="input-container">
        <input class="submit-btn" type="submit" value="Cadastrar" />
      </div>
    </form>
  </div>
</template>

<script>
import Message from "./Message";

export default {
  name: "CandidateForm",
  data() {
    return {
      nome: null,
      contato: null,
      habilidades: null,
      msg: null,
    };
  },
  methods: {
    async createCandidato(e) {
      e.preventDefault();

      const data = {
        nome: this.nome,
        contato: this.contato,
        habilidades: this.habilidades,
        status: "Não contratado",
        contratacao_data: "",
      };

      const dataJson = JSON.stringify(data);

      const req = await fetch("http://localhost:8081/api/candidato", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: dataJson,
      });

      const res = await req.json();

      console.log(res);

      this.msg = "Cadastro realizado com sucesso!";

      // clear message
      setTimeout(() => (this.msg = ""), 3000);

      // limpar campos
      this.nome = "";
      this.contato = "";
      this.habilidades = "";
    },
  },
  mounted() {},
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

label {
  font-weight: bold;
  margin-bottom: 15px;
  color: #222;
  padding: 5px 10px;
  border-left: 4px solid #2C3E50;
}

input,
select {
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
  color: #ffffff;
  font-weight: bold;
  border: 2px solid #222;
  padding: 10px;
  font-size: 16px;
  margin: 0 auto;
  cursor: pointer;
  transition: 0.5s;
}

.submit-btn:hover {
  background-color: transparent;
  color: #222;
}
</style>