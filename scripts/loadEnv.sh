#!/bin/bash
clear

echo "Setting up local environment for ClaremontReview\n"

echo "Installing all needed gems"
bundle install

echo "Starting up elasticsearch service"
sudo service elasticsearch restart

echo "Setting up local database"
bundle exec rake db:reset
bundle exec rake db:migrate
bundle exec rake task:importjson
bundle exec rake task:slug
bundle exec rake searchkick:reindex CLASS=Course
