FROM ruby:3.0.1

ARG RAILS_ROOT=/app
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client tzdata imagemagick build-essential libreoffice nano vim npm

ARG ENABLE_CHROME=true

RUN if [ "$ENABLE_CHROME" = true ]; then wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb; fi
RUN if [ "$ENABLE_CHROME" = true ]; then dpkg -i google-chrome*.deb || apt update && apt-get install -f -y; fi

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
