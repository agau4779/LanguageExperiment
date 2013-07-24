#!/bin/bash
echo "Resetting Local Database..."
echo "Dropping tables..."
bundle exec rake db:drop;
echo "Re-creating..."
bundle exec rake db:create;
echo "Migrating..."
bundle exec rake db:migrate;
echo "Seeding..."
bundle exec rake db:seed;
echo "Done! :D"