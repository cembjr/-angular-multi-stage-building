FROM node:latest as build
RUN npm install -g @angular/cli
ADD ./package.json /app/package.json
WORKDIR /app
RUN npm install
ADD . /app/
RUN ng build

FROM nginx:alpine
COPY --from=build /app/dist/angular-app /usr/share/nginx/html
