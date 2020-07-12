FROM ruby:2.7.1-slim
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /manageContact
WORKDIR /manageContact
ADD Gemfile /manageContact/Gemfile
ADD Gemfile.lock /manageContact/Gemfile.lock
RUN gem install bundler:1.17.3
RUN bundle install
ADD . /manageContact