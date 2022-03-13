FROM ruby:3.1

WORKDIR /app
COPY Gemfile .
COPY Gemfile.lock .
RUN bundle install
