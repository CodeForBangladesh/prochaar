FROM ruby:2.4.1

MAINTAINER Code for Bangladesh

RUN apt-get update -qq && \
    apt-get install -y nano build-essential mysql-client libmysqlclient-dev && \
    gem install bundler

RUN mkdir -p /app
WORKDIR /app

COPY Gemfile Gemfile.lock ./
COPY config/database.sample.yml config/database.yml
COPY config/secrets.sample.yml config/secrets.yml

RUN sed -i -e 's/\*\*\*\*/root/g' config/database.yml
RUN sed -i -e 's/localhost/prochar-mysql/g' config/database.yml
RUN sed -i -e 's/your_db_name/prochar/g' config/database.yml

RUN gem install bundler && bundle install --jobs 20 --retry 5

COPY . ./


ENV RAILS_ENV=development

EXPOSE 3000

CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]
