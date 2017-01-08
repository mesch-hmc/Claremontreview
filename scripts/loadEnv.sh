#!/bin/bash
clear

echo "Setting up local environment for ClaremontReview\n"

echo "Installing all needed gems"
bundle install

echo "Starting up elasticsearch service"
sudo service elasticsearch restart

echo "Setting up local database"
rake db:reset
rake db:migrate
rake task:importjson
rake task:slug
rake searchkick:reindex CLASS=Course

echo "Running local server on localhost"
rails s -b 0.0.0.0
