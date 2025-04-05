<script setup>
import { ref, onMounted } from "vue"
import ModalContato from "../components/ModalContato.vue"
import PdfViewer from '../components/PdfViewer.vue';

let nome = import.meta.env.VITE_NAME_USUARIO
const isModalOpen = ref(false)
const displayText = ref("")
const fullText = `${nome}`
const terms = ['Web Developer', 'Full Stack']
const index = ref(0)
const nameCurrent = ref(terms[index.value])
const isCvcOpen = ref(false)
const pdfFile = ref("/link-cv-2025.pdf")

function changeName() {
  index.value = (index.value + 1) % terms.length
  nameCurrent.value = terms[index.value]
}
const downloadCvc = () => {
  const pdfPath = new URL("../assets/link-cv-2025.pdf", import.meta.url).href
  const link = document.createElement("a");
  link.href = pdfPath;
  link.download = "link-cv-2025.pdf";
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
const openCvc = () => {
  isCvcOpen.value = true
}
const closeCvc = () => {
  isCvcOpen.value = false
}
onMounted(() => {
  let index = 0
  const typeEffect = () => {
    displayText.value = fullText.slice(0, index)
    index++
    if (index> fullText.length) {
      setTimeout(() => {
        index = 0
        typeEffect()

      }, 1000)
    } else {
      setTimeout(typeEffect, 100)
    }

  }
  typeEffect()
  // setInterval(changeName, 2000)
})
</script>

<template>
  <div class="home">
    <div class="content">
      <div class="left-side">
        <img src="../assets/img/foto1.jpeg" class="img-foto1" alt="">        
      </div>
    
      <div class="right-side">
        <p class="p-nome"> {{ nameCurrent }} </p>
        <p class="h1-nome"> Hi! I'm {{ displayText }} </p>
        <div class="plate">
        </div>
        <p class="p-descricao">Desenvolvedora de software com mais de 4 anos de experiência, atuando na manutenção de sistemas legados e no desenvolvimento de novas soluções. Especialista em back-end com PHP (Flight, Lumen, Laravel), Python (Flask, FastAPI, Django) e banco de dados MySQL e SQLite. No front-end, trabalhei com Vue.js, Quasar, HTML, CSS e JavaScript. Experiência em automação com Scrapy, conteinerização com Docker e controle de versão com Git. Comprometida com boas práticas de desenvolvimento, segurança e escalabilidade, estou sempre em busca de aprimoramento e novos desafios.</p>
        <div class="btn-container">
          <button class="btn btn-download" @click="openCvc">Abrir CV</button>
          <!-- <button class="btn btn-download" @click="downloadCvc">Download CV</button> -->
          <button class=" btn btn-contato" @click="openModal">Contato</button>
        </div>
        <ModalContato :isOpen="isModalOpen" @close="closeModal" />
        <PdfViewer v-if="isCvcOpen" :isOpen="isCvcOpen" @close="closeCvc" />
      </div>
    </div>
  </div>
</template>

<style lang="scss" scoped>
.home {
  height: 100vh;
  width: 100vw;
  display: flex;
  align-items: center;
  justify-content: center;
  .content {
    display: flex;
    width: 100%;
    height: 100%;
  }
  .left-side {
    flex:1;
    background-color: #000;
    display: flex;
    align-items: center;
    justify-content: right;
  }
  .right-side {
    flex:2;
    background-color: #016961;
    color: #fff;
    display: flex;
    flex-direction : column;
    align-items: left;
    justify-content: center;
    text-align: left;
    padding: 20px;
    padding-left: 25px;
  }
}
.img-foto1 {
  width: 90%;
  max-width: 500px;
  height: auto;
  border-radius: 50%;
  transition: transform 0.3s ease;
  &:hover {
    transform: scale(1.1);
  }
}
.h1-nome {
  font-size: 2.5vw;
  font-family: 'Courier New', monospace;
  text-shadow: 1px 1px 2px black, 0 0 25px rgb(0, 255, 191), 0 0 5px rgb(0, 139, 120);
}

.p-nome {
  font-weight: normal;

  //text-align: center;
  //background-color:#ffffff;
  //color: #016961;
  font-size: 1.5vw;
 // animation: rotacaoPlaca 2s ease-in-out infinite; 

}
@keyframes rotacaoPlaca {
  0% {
      transform: rotateX(0deg);
  }

  50% {
      transform: rotateX(90deg);
      opacity: 0;
  }
  100% {
      transform: rotateX(0deg);
      opacity: 1;
  }
}
.p-descricao {
  font-size: 1vw;
  max-width: 80%;
}
.btn-container {
  display: flex;
  gap: 20px;
  margin-top:20px;
}
.btn {
  padding: 14px 40px;
  border-radius: 18px;
  font-size: 16px;
  background: #fff;
  color: #016961;
  border: none;
  cursor: pointer;
  transition: box-shadow 0.3s;
  
  &:hover {
    box-shadow: 0 12px 16px rgba(230, 218, 218, 0.24), 0 17px 50px rgba(220, 240, 238, 0.19);
  }
}

@media (max-width: 768px) {
  .content {
    flex-direction: column;
  }

  .left-side, .right-side {
    flex: none;
    width: 100%;
    height: 50%;
  }

  .h1-nome {
    font-size: 6vw;
  }

  .p-nome, .p-descricao {
    font-size: 4vw;
  }
}
</style>
