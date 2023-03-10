FROM node:14 as build-stage 
#WORKDIR /Users/hong-geumbi/Desktop/test1

COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

FROM nginx:stable-alpine as production-stage
COPY --from=build-stage ./dist /usr/share/nginx/html
EXPOSE 80

CMD ["nginx", "-g","daemon off;"]
