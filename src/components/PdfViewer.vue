<script setup>
import { defineProps, defineEmits, ref, onMounted } from "vue"  
import PDF from "pdf-vue3"

const isLoading = ref(true)

const props = defineProps({
    isOpen:Boolean
})
const emit = defineEmits(['close'])
const closeCvc = () => {
    emit("close")
}

onMounted(() => {
    if (props.isOpen) {
        isLoading.value = false
    }
})
</script>

<template>
    <div v-if="isOpen" class="modal-overlay" @click.self="closeModal">
        <div class="modal">
            <button class="close-btn" @click="closeCvc">X</button>

            <!-- Loader -->
            <div v-if="isLoading" class="loader-container">
            <div class="loader"></div>
            <p>Carregando PDF...</p>
            </div>
            <div class="pdf-container">

                <PDF v-if="!isLoading" src="/link-cv-2025.pdf" showBackToTopBtn="false" />
            </div>
        </div>
    </div>
 
</template>

<style lang="scss" scoped>

.modal-overlay {
    position: fixed;
    top: 0;
    left: 0;
    width: 100vw;
    height: 100vh;
    background-color: rgba(0, 0, 0, 0.5); /* Fundo escurecido */
    display: flex;
    align-items: center;
    justify-content: center;
    padding: 20px; /* Espaçamento ao redor */
  }

.modal {
    background: rgb(94, 91, 91);
    padding: 20px;
    border-radius: 10px;
    width: 90%;
    max-width: 700px;
    max-height: 90vh;
    overflow-y: auto; 
  }
  /* Responsividade */
@media (max-width: 768px) {
    .modal {
      width: 95%;
      max-width: 600px;
    }
  }
  
 
  .close-btn {
    padding: 10px;
    background: #016961;
    color: white;
    border: none;
    border-radius: 40%;
    cursor: pointer;
    font-weight: bold;
    font-size:20px;
    &:hover {
        background-color:rgb(3, 66, 32);
    }
  }
  ul {
    list-style-type: none;
  }
  .text-li {
    font-size:25px;
  }
  .ml-1 {
    margin: 5px;
  }
  .text-modal-titulo {
    font-size: 50px;
    padding-bottom: 10px;
  }
  /* Loader */
.loader-container {
    text-align: center;
    margin-top: 20px;
  }
  
  .loader {
    border: 4px solid rgba(0, 0, 0, 0.1);
    border-left-color: #016961;
    border-radius: 50%;
    width: 40px;
    height: 40px;
    animation: spin 1s linear infinite;
    margin: 0 auto;
  }
  
  @keyframes spin {
    0% {
      transform: rotate(0deg);
    }
    100% {
      transform: rotate(360deg);
    }
  }
</style>