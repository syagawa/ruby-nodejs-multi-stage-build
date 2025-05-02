FROM node:22.15-bookworm-slim AS build-node-modules
WORKDIR /app
RUN npm install -g npm@latest

FROM ruby:3.4.3-slim-bookworm
WORKDIR /app

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev
RUN apt-get install -y curl unzip wget vim git

COPY --from=build-node-modules /usr/local /usr/local

ENTRYPOINT ["/app/entrypoint.sh"]
