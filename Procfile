web: bundle exec unicorn -p $PORT -E $RACK_ENV
worker: bundle exec rake resque:work QUEUE='*' RAILS_ENV=production
