# Usa a imagem oficial do Node.js (substitua pela última versão disponível)
FROM node:latest

# Define o diretório de trabalho dentro do container
WORKDIR /app

# Copia os arquivos package.json e package-lock.json para o container
COPY package*.json ./

# Instala as dependências do projeto
RUN npm install -g @vue/cli && npm install
RUN npm install -D sass-embedded
RUN npm install primeicons


# Copia os arquivos do projeto para o container
COPY . .

# Expõe a porta padrão do Vue.js
EXPOSE 5173

# Comando para iniciar o servidor de desenvolvimento
CMD ["npm", "run", "dev", "--", "--host"]
