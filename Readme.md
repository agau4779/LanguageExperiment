Language Learning Experiment
======

Setup
- `git clone git@github.com:agau4779/LanguageExperiment.git`
- `cd LanguageExperiment`
- `bundle install`
- `bundle exec rake db:drop db:create db:migrate`
- `bundle exec rake db:seed`

To push to Heroku, add the remote:
- git remote add heroku git@heroku.com:languagelearningexperiment.git

To reset database on Heroku, use the following commands:
- heroku pg:reset DATABASE
	- type in name of app to confirm
- heroku run rake db:migrate
- heroku run rake db:seed

TODO
======

- Set a cookie containing the lock_id when entering training phase
- Add before_filter that checks for whether the cookie is set or not
- Add a validation check, for when a user submits their choices for the pairings, making sure that the session is correct