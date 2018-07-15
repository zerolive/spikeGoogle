FROM ruby:2.4.0

WORKDIR /api
ADD . /api

RUN gem install bundle
RUN bundle install

CMD bundle exec rackup -p 8000 -o 0.0.0.0
