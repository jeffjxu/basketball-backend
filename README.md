# basketball-backend
A backend API service in Ruby on Rails that interacts with Heroku PostgreSQL database for our iOS Basketball App

## Setup

To make change to this app, clone the repository, then run `BasketballAPI` and `bundle install`.

#### PostgreSQL Setup
- Download [Postsgresapp](Postgresapp.com) and follow instructions to set PATH variable
- find the location of your pg_config (likely in `/Applications/Postgres.app/Contents/Versions/13/bin`)
- run `gem install pg -- --with-pg-config=/Path/to/pg_config`
- run `rake db:setup`
- run `rake db:migrate`

## Deployment

The app is deployed to [secure-hollows-77457.herokuapp.com](secure-hollows-77457.herokuapp.com)

List all users at [secure-hollows-77457.herokuapp.com/users](secure-hollows-77457.herokuapp.com/users)
