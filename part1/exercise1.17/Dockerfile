FROM node:14.15.1

WORKDIR /usr/src/app
RUN npx create-react-app .
COPY package*.json ./
RUN npm install
COPY . .
EXPOSE 3000

CMD [ "npm", "start" ]



