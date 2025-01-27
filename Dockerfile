FROM --platform=linux/amd64 ruby:2.6.5
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs npm
RUN npm -g install yarn
RUN yarn global add phantomjs-prebuilt
RUN mkdir /myapp
WORKDIR /myapp
ADD Gemfile /myapp/Gemfile
ADD Gemfile.lock /myapp/Gemfile.lock
RUN gem install bundler -v 1.17.3
RUN bundle install
ADD . /myapp
