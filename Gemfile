source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails',               '~> 5.1.4'
gem 'pg',                  '~> 0.18'
gem 'puma',                '~> 3.7'
gem 'sass-rails',          '~> 5.0'
gem 'uglifier',            '>= 1.3.0'
gem 'coffee-rails',        '~> 4.2'
gem 'jbuilder',            '~> 2.5'

gem 'spree',               '~> 3.4.0'
gem 'spree_auth_devise',   '~> 3.3'
gem 'spree_gateway',       '~> 3.3'

group :development, :test do
  gem 'pry-rails'
  gem 'rspec-rails',       '~> 3.6'
end

group :development do
  gem 'web-console',       '>= 3.3.0'
  gem 'listen',            '>= 3.0.5', '< 3.2'
end

group :test do
  gem 'database_cleaner'
  gem 'factory_bot_rails', '~> 4.0'
  gem 'ffaker'
  gem 'shoulda-matchers',  '~> 3.1'
end
