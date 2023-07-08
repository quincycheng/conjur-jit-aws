FROM ruby:2.7

RUN apt-get update -qq

# throw errors if Gemfile has been modified since Gemfile.lock
RUN bundle config --global frozen 1

WORKDIR /usr/src/app

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .
CMD ["ruby", "./app.rb", "-o","0:0:0:0"]
EXPOSE 4567
