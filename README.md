# README

The Ruby Bank

## Prerequisites
```
1. Build a simple Rails banking app
2. Via the console you can create users with password
3. Via the console you can give the user credit
4. The user must be able to log in
5. User has a bank account with balance
6. Users can transfer money to each other through the UI
7. Users may not have a negative balance on their account
8. It must be traceable how a user obtained a certain balance
```
## Main system dependencies

- Ruby 3.1.2 (Rails 7.0+)
- PostgreSQL 9.3+

## Local deployment

- Install system dependencies
- Ask credentials keys (development.key, test.key) from repository maintainers and copy them to /config/credentials/*
- Run `bundle exec rails db:create` to create a new database
- Run `bundle exec rails db:migrate` to run all the migrations
- Run `bundle exec rails db:seed` to create test user with account
- Run `bundle install` to setup all the needed gems
- Run `lefthook install` to enable linters running on pre-push, pre-commit hooks
- Run `rails s` to run the appliction

## Linting

- Configuration is placed in `lefthook.yml.` in the root of project
- Lint all the project with `lefthook run all`

## Tests run

- Run unit tests `bundle exec rspec`
