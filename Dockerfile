# Step 1
FROM node:16.13.0-alpine3.14 as build

WORKDIR /app

COPY . /app

RUN npm install

RUN npm run build --prod

# Step 2
FROM nginx:1.17.1-alpine

COPY --from=build /app/dist/practica5-angular /usr/share/nginx/html



 