# Estágio 1: Construir a aplicação Vue.js
FROM node:14-alpine as builder
WORKDIR /app
COPY package.json yarn.lock ./
RUN yarn install
COPY . .
RUN yarn build

# Estágio 2: Criar a imagem final com apenas os artefatos de construção necessários
FROM nginx:alpine
COPY --from=builder /app/dist /usr/share/nginx/html
