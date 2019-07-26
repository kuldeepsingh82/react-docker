FROM node:alpine as buildstep

WORKDIR /app

COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
COPY --from=buildstep /app/build /usr/share/nginx/html