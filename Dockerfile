# Estágio 1: Build da Aplicação Vite
# Usamos uma imagem Node.js leve (baseada em Alpine) para o build
FROM node:20-alpine AS build

# Define o diretório de trabalho dentro do contêiner
WORKDIR /app

# Copia os arquivos de manifesto de pacotes
COPY package.json package-lock.json ./

# Instala as dependências do projeto
RUN npm install

# Copia o restante do código-fonte da aplicação
COPY . .

# Executa o script de build para gerar os arquivos estáticos
# A saída será na pasta /app/dist
RUN npm run build

# Estágio 2: Servidor de Produção com Nginx
# Usamos uma imagem Nginx leve (baseada em Alpine) para servir os arquivos
FROM nginx:stable-alpine

# Instala o gettext que contém o envsubst
RUN apk add --no-cache gettext

# Copia os arquivos estáticos gerados no estágio de build
# para o diretório padrão do Nginx
COPY --from=build /app/dist /usr/share/nginx/html

# Copia o template de configuração do Nginx
COPY nginx.conf /etc/nginx/nginx.template

# Expõe a porta 80, que o Nginx usa por padrão (o Railway injetará a variável PORT)
EXPOSE 80

# Comando para iniciar o servidor Nginx em modo "daemon off"
# Usa envsubst para substituir a variável $PORT no template e gerar o arquivo de configuração final
CMD ["/bin/sh", "-c", "envsubst < /etc/nginx/nginx.template > /etc/nginx/conf.d/default.conf && nginx -g 'daemon off;'"]
