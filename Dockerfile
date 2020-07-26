FROM ruby:2.6.5-slim
RUN apt-get update -qq && \
    apt-get install -y build-essential=12.6 libpq-dev=11.7-0+deb10u1 nodejs=10.21.0~dfsg-1~deb10u1 --no-install-recommends && \
    rm -rf /var/lib/apt/lists/*
RUN mkdir /manageContact
WORKDIR /manageContact
COPY Gemfile /manageContact/Gemfile
COPY Gemfile.lock /manageContact/Gemfile.lock
RUN gem install bundler:1.17.3 && bundle install --jobs=4
COPY . /manageContact
