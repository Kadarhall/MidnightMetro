Project 1 - DC Dish
=============

Overview

Crowdsourced web app for users to get a feel of a particular neighborhood in the DC metro area throough anonymous posts.

http://dc-dish.herokuapp.com/



Technologies Used

Ruby 2.1.2
Sinatra
ActiveRecord
PSQL
User Authentication via Simple Authentication Gem
HTML5
CSS3


User Stories Completed

User can signup/login
User can create posts
User can delete posts
User can view posts by other users
User can view posts by neighborhoods
User can logout


User stories to be Completed

User can edit only their posts
User can delete only their posts
User can create new Neighborhoods
Styling
Testing
Refactoring

https://www.pivotaltracker.com/n/projects/1233672




Set Up


$ heroku create
$ git push heroku master
$ heroku run rake db:seed
$ heroku run bundle exec rake db:migrate
$ heroku open
