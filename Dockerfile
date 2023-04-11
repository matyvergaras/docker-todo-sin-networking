# Para uso con nginx --> archivo multifase

# Fase 1: Builder
FROM node:16-alpine as builder

WORKDIR '/app'

COPY package.json .
RUN npm install
COPY . .
RUN npm run start

# Fase 2: Ejecución
FROM nginx

COPY --from=builder /app/build /usr/share/nginx/html
