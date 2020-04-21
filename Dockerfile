FROM node:alpine
  WORKDIR /app
  COPY package*.json ./
  RUN npm install
  COPY . .
  RUN npm run build
 
  FROM nginx
  # EXPOSE port# 80 is required for AWS elasticbeanstalk when starts the docker container
  EXPOSE 80
  COPY --from=0 /app/build /usr/share/nginx/html