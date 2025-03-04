# 📌 Passos para Criar o Projeto Vue.js Corretamente no Docker:

### Garanta que está no diretório correto

cd ~/Documents/portifolio

Remova qualquer container em execução (caso tenha iniciado antes):

docker-compose down

Crie o projeto Vue.js dentro do container

Execute este comando para criar o projeto diretamente no diretório atual:

docker run -it --rm -v $(pwd):/app -w /app node:latest npx create-vue@latest portifolio-app

📌 Se o terminal pedir para responder perguntas, escolha as opções desejadas e continue.

Verifique se o projeto foi criado
Depois que o processo terminar, veja se a pasta portifolio-app foi criada:

ls

O esperado é ver uma saída parecida com:

docker-compose.yml  Dockerfile  portifolio-app/

Entre no diretório do projeto

cd portifolio-app

Construa e rode o container com o projeto Vue.js

    docker-compose up --build

Agora, o servidor do Vue.js deve rodar dentro do Docker, e você pode acessar pelo navegador:

👉 http://localhost:5173

Se algo não funcionar, me avise qual foi o erro ou comportamento! 🚀


### Entrar no container 

docker run --rm -it portifolio_vue-app  /bin/sh


###Alterar as permissões

sudo chown -R $USER:$USER portifolio-app
