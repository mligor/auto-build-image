FROM ruby:2.5.3-alpine

WORKDIR /usr/src/app

COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . ./

EXPOSE 5000
CMD ["bundle", "exec", "rackup", "--host=0.0.0.0", "--port=5000"]
