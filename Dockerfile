FROM ruby:2.6
RUN apt-get update\
  && apt-get install -y --no-install-recommends\
  nodejs  \
  mariadb-client  \
  build-essential  \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*
WORKDIR /ronstagram

COPY Gemfile /ronstagram/Gemfile
COPY Gemfile.lock /ronstagram/Gemfile.lock

RUN gem install bundler
RUN bundle install

ADD . /ronstagram
