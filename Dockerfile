FROM node:14 as builder

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

RUN npm run build

FROM nginx:alpine

COPY --from=builder /app/public /usr/share/nginx/html

EXPOSE 8000

CMD ["nginx", "-g", "daemon off;"]
