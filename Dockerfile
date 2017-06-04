FROM ruby:2.4.1-alpine
ARG KONTENA_GEM_VERSION

WORKDIR /app
RUN gem install kontena-cli $KONTENA_GEM_VERSION

COPY entrypoint.sh .

ENTRYPOINT /app/entrypoint.sh
