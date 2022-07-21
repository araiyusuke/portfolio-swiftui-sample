FROM node:14.11.0 as node-build

COPY ./src /application

WORKDIR /application

RUN apt-get update \
  && npm install \
  && npm run prod

# FROM nginx:1.19.2 224MB
FROM nginx:1.19.2-alpine
WORKDIR /application

# RUN apt-get update

# Nginx1.9以降で環境変数を扱うため、templatesに設定ファイルを置く。
COPY ./docker/nginx/templates /etc/nginx/templates

COPY --from=node-build /application/public /application/public/ 
COPY --from=node-build /usr/local/bin/ /usr/local/bin/
COPY --from=node-build /usr/local/lib/node_modules /usr/local/lib/node_modules
COPY ./src /application
EXPOSE 80