FROM node:alpine as builder

WORKDIR '/app'

COPY package.json .
RUN npm install

COPY . .
RUN npm run build


FROM nginx
EXPOSE 80
# GET pre-built files from "builder-image"
COPY --from=builder /app/build /usr/share/nginx/html