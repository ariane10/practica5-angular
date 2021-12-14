# Step 1
FROM node:16.13.0-alpine3.14 as build

WORKDIR /app

COPY package.json /app

RUN npm install

COPY . /app

RUN ng build

# Step 2
FROM nginx:1.17.1-alpine

COPY --from=build /app/dist/practica5-angular /usr/share/nginx/html



 