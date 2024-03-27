# Stage 1: Builder stage
FROM node:16-alpine as builder
WORKDIR '/app'
COPY package.json ./
RUN npm install
COPY ./ ./
RUN npm run build

# Stage 2: Nginx stage
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
