FROM node:alpine as build-stage
USER node

WORKDIR /app
COPY package*.json ./
RUN npm install && \
    npm run build

FROM nginx

COPY --from=build-stage /app/dist/ /usr/share/nginx/html