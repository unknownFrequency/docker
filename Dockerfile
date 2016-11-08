FROM ruby:2.3.1
RUN apt-get update -qq && \
    apt-get install -y build-essential libpq-dev nodejs && \
    apt-get clean

## Rails App
ENV APP /app
RUN mkdir $APP
WORKDIR $APP
ADD Gemfile* $APP/

ENV BUNDLE_GEMFILE=$APP/Gemfile \
  BUNDLE_JOBS=2 \
  BUNDLE_PATH=/bundle

ADD . $APP
RUN mkdir -p tmp/sockets

VOLUME $APP/public
VOLUME $APP/tmp
