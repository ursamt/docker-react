FROM node:alpine as builder
WORKDIR /app
COPY package.json ./
RUN npm install
COPY . .
# Install some dependencies
RUN npm run build

FROM nginx
# EXPOSE port# 80 is required for AWS elasticbeanstalk when starts the docker container
EXPOSE 80 
COPY --from=builder /app/build /usr/share/nginx/html