# using 'as builder' to tag the phase
FROM node:16-alpine as builder
WORKDIR '/app'
COPY ./package.json ./
RUN npm install
COPY ./ ./
RUN npm run build

FROM nginx
# from the nginx docs we get the folder to copy the build directory contents
COPY --from=builder /app/build/ /usr/share/nginx/html