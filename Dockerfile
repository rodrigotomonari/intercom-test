FROM ruby:2.5-slim

WORKDIR /usr/src/app

COPY . .

CMD ["./bin/main.rb"]