# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.0'

gem 'rails',                                            '~> 7.0.1'

gem 'bootsnap',                                         '~> 1.12', require: false
gem 'devise',                                           '~> 4.8', '>= 4.8.1'
gem 'dry-transformer',                                  '>= 0.1'
gem 'dry-validation',                                   '>= 1.6'
gem 'jbuilder',                                         '~> 2.11', '>= 2.11.5'
gem 'money-rails',                                      '~> 1.7'
gem 'pg',                                               '~> 1.1'
gem 'puma',                                             '~> 5.0'
gem 'turbo-rails',                                      '~> 1.1', '>= 1.1.1'
gem 'webpacker',                                        '~> 5.4', '>= 5.4.3'

group :development, :test do
  gem 'brakeman',                                       '~> 5.2', '>= 5.2.3'
  gem 'factory_bot_rails',                              '~> 6.2'
  gem 'ffaker',                                         '~> 2.21'
  gem 'lefthook',                                       '~> 1.0', '>= 1.0.5'
  gem 'pry-byebug',                                     '~> 3.9'
  gem 'rubocop',                                        '~> 1.31', '>= 1.31.2', require: false
  gem 'rubocop-performance',                            '~> 1.11.3'
  gem 'rubocop-rails',                                  '~> 2.10.1'
  gem 'rubocop-rspec',                                  '~> 2.3.0'
end

group :development do
  gem 'web-console', '~> 4.2'
end

group :test do
  gem 'database_cleaner-active_record',                 '~> 2.0', '>= 2.0.1'
  gem 'rails-controller-testing',                       '~> 1.0', '>= 1.0.5'
  gem 'rspec-its',                                      '~> 1.3.0'
  gem 'rspec-rails',                                    '~> 5.1', '>= 5.1.2'
  gem 'shoulda-matchers',                               '~> 5.1'
  gem 'simplecov',                                      '~> 0.21.2', require: false
end
