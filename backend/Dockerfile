FROM ruby:2.3
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
RUN mkdir /app
WORKDIR /app
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
RUN bundle install
COPY . /app

EXPOSE 5000

# Start the main process.
CMD ["thin", "start", "-p", "5000"]