FROM ruby:3.0.1

ARG RAILS_ROOT=/app
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client tzdata imagemagick build-essential libreoffice nano vim npm

RUN gem install bundler:2.1.4

RUN mkdir $RAILS_ROOT
WORKDIR $RAILS_ROOT

COPY Gemfile Gemfile.lock  ./
RUN bundle install --jobs 5

COPY package.json yarn.lock ./
RUN npm install --global yarn
RUN yarn install

COPY . $RAILS_ROOT

ENV PATH=$RAILS_ROOT/bin:${PATH}
