#!/usr/bin/env bash
set -ex
export DEBIAN_FRONTEND=noninteractive

apt-get update && apt-get -y install libpq-dev tzdata
export RAILS_ENV=test

gem install bundler -v 1.17.3 
bundle install -j4
bundle exec rake test_app
mv database.yml.dummy ./spec/dummy/config/database.yml
cat ./spec/dummy/config/database.yml

bundle exec rspec