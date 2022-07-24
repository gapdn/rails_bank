# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
user = User.new(
  first_name: FFaker::NameUA.first_name,
  last_name: FFaker::NameUA.last_name,
  email: 'test_email@gmail.com',
  password: '12345678'
)

user.accounts.build(
  number: FFaker::Number.number(digits: 16)
)

user.save
