<script setup>
import { ref } from "vue"
import ModalContato from "../components/ModalContato.vue"

const isModalOpen = ref(false)

const downloadCvc = () => {
  const pdfPath = new URL("../assets/DanieleGalvao-cv-2025.pdf", import.meta.url).href
  const link = document.createElement("a");
  link.href = pdfPath;
  link.download = "DanieleGalvao-cv-2025.pdf";
  document.body.appendChild(link);
  link.click();
  document.body.removeChild(link);
}

const openModal = () => {
  isModalOpen.value = true
}
const closeModal = () => {
  isModalOpen.value = false
}
</script>

<template>
  <div class="home">
    <div class="home-foto">
      <img src="../assets/img/foto1.jpeg" class="img-foto1" alt="">
      <p class="p-nome">Web Developer</p>
      <p class="h1-nome">Hi! Daniele Ferreira Galvão</p>
      <p class="p-descricao">Desenvolvedora de software com mais de 4 anos de experiência, atuando na manutenção de sistemas legados e no desenvolvimento de novas soluções. Especialista em back-end com PHP (Flight, Lumen, Laravel), Python (Flask, FastAPI, Django) e banco de dados MySQL e SQLite. No front-end, trabalhei com Vue.js, Quasar, HTML, CSS e JavaScript. Experiência em automação com Scrapy, conteinerização com Docker e controle de versão com Git. Comprometida com boas práticas de desenvolvimento, segurança e escalabilidade, estou sempre em busca de aprimoramento e novos desafios.</p>
      <button class="btn btn-download" @click="downloadCvc">Download CV</button>
      <button class=" btn btn-contato" @click="openModal">Contato</button>
      <ModalContato :isOpen="isModalOpen" @close="closeModal" />
    </div>
  </div>
</template>

<style lang="scss" scoped>
.home {
    background-color: #000;
    min-height: 100vh;
    display: flex;
    justify-content: center;
    align-items: center;
  
    .home-foto {
      background-color: #016961;
      max-width: 600px;
      width: 100%;
      min-height: 100vh;
      border: 1px solid #000;
      padding: 10px;
      padding-left: 300px;
    }
  }
  .img-foto1 {
 
    border-radius: 50%;
    object-fit: cover;
    margin-top: 50%;
    margin-bottom: 15px;
    transition: transform 0.3s ease;
    clip-path: circle(45%);
    shape-outside: circle(50%);
    max-width: 1020px;

    &:hover {
      transform: scale(1.1);
    }
  }
  
  .h1-nome {
    margin: 0;
    position: fixed;
    top: 41%;
    left: 66%;
    transform: translate(-50%, -50%);
    font-family: sans-serif;
    font-size: 45px;
    text-shadow: 1px 1px 2px black, 0 0 25px rgb(0, 255, 191), 0 0 5px rgb(0, 139, 120);
  }
  .p-nome {
    font-size: 18px;
    margin: 0;
    position: fixed;
    top: 37%;
    left: 55%;
    transform: translate(-50%, -50%);

  }
  .p-descricao {
    margin: 0;
    position: fixed;
    top: 54%;
    left: 68%;
    transform: translate(-50%, -50%);

  }
  .btn {
   
    padding: 14px 40px;
    border-radius: 18px;
    font-size: 16px;
    &:hover {
      box-shadow: 0 12px 16px 0 rgba(230, 218, 218, 0.24), 0 17px 50px 0 rgba(220, 240, 238, 0.19);
    }
    
  }
  .btn-download {
    top: 78%;
    left: 48%;
    margin: 0;
    position: fixed;    
    transform: translate(-50%, -50%);
  }
  .btn-contato {
    top: 78%;
    left: 68%;
    margin: 0;
    position: fixed;    
    transform: translate(-50%, -50%);
  }

  /* Responsividade */
@media (max-width: 768px) {
  .home {
    padding: 10px;
  }

  .home-foto {
    padding: 20px;
  }

  .h1-nome {
    font-size: 20px;
  }

  .p-descricao {
    font-size: 13px;
  }

  .btn-container {
    flex-direction: column;
  }
}
</style>
