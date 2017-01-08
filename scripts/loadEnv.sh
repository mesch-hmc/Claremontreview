#!/bin/bash
clear

echo "Setting up local environment for ClaremontReview..."

echo
echo "Installing all needed gems..."
echo
bundle install

echo
echo "Starting up elasticsearch service..."
echo
sudo service elasticsearch restart

echo
echo "Setting up local database..."
echo
bundle exec rake db:reset
bundle exec rake db:migrate
bundle exec rake task:importjson
bundle exec rake task:slug
bundle exec rake task:codetitleinstructor
bundle exec rake searchkick:reindex CLASS=Course
