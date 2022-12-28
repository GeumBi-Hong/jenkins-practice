FROM nginx:stable-alpine as production-stage
COPY --from=build-stage ./dist /usr/share/nginx/html
EXPOSE 80

COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build



CMD ["nginx", "-g","daemon off;"]
