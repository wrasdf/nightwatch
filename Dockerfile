FROM node:13.8.0-alpine3.11

WORKDIR /app
RUN apk --update add build-base gcc \
    bash curl && \
  rm -rf /tmp/* /var/cache/apk/*

COPY package.json *yarn* /app/
RUN yarn global add nightwatch
RUN yarn install
COPY . /app
