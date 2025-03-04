<script setup>
    import { defineProps, defineEmits } from "vue"

import 'primeicons/primeicons.css'


    const props =  defineProps({
        isOpen: Boolean
    })

    const emit = defineEmits(["close"])

    const closeModal = () => {
        emit("close")
    }
</script>
<template>
    <div v-if="isOpen" class="modal-overlay" @click.self="closeModal">
        <div class="modal">
            <button class="close-btn" @click="closeModal">X</button>

            <p class="text-modal-titulo">Modal</p>

           

            <ul>
                <li><i class="pi ml-1 pi-envelope" style="font-size: 1.5rem"></i> <span class="text-li"> E-mail: daniele-fg@hotmail.com</span></li>
                <li><i class="pi ml-1 pi-envelope" style="font-size: 1.5rem"></i><span class="text-li"> E-mail: danielefgjesus@gmail.com</span></li>
                <li><i class="pi ml-1 pi-linkedin" style="font-size: 1.5rem"></i><span class="text-li"> Linkedin: <a href="https://www.linkedin.com/in/daniele-galvão-10ba00209" target="_blank">www.linkedin.com/in/daniele-galvão-10ba00209</a></span></li>
                <li><i class="pi ml-1 pi-github" style="font-size: 1.5rem"></i><span class="text-li"> Git: <a href="https://github.com/DanieleFG" target="_blank">https://github.com/DanieleFG</a></span></li>
    
            </ul>
        </div>
    </div>
</template>
<style lang="scss" scoped>
.modal-overlay {
    position: fixed;
    top:0;
    left:0;
    width: 100%;
    height: 100%;
    background: rgba(0, 0, 0, 0.5);
    display: flex;
    justify-content: center;
    align-items: center;
}

.modal {
    background: #016961;
    color:#fff;
    padding: 20px;
    border-radius: 8px;
    font-size:16px;
    text-align: center;
    width: 800px;
    height: 400px;
    box-shadow: 0px 5px 10px rgba(0, 0, 0, 0.3);
  }
  
  .close-btn {
    background: #fff;
    border: none;
    font-size: 20px;
    cursor: pointer;
    position: absolute;
    top: 10px;
    right: 10px;
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
</style>