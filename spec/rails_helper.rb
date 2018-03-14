require 'spec_helper'
require 'paperclip/matchers'

ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)

require 'spree/testing_support/factories'

abort "The Rails environment is running in production mode!" if Rails.env.production?

require 'rspec/rails'
ActiveRecord::Migration.maintain_test_schema!

Dir[Rails.root.join('spec/support/**/*.rb')].each(&method(:require))

FactoryBot.definition_file_paths << File.expand_path('../support/factories', __FILE__)

RSpec.configure do |config|
  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!

  config.before :suite do
    DatabaseCleaner.clean_with(:truncation)
    DatabaseCleaner.strategy = :transaction
  end

  config.before :each do
    DatabaseCleaner.start
  end

  config.after :each do
    DatabaseCleaner.clean
  end

  config.include FactoryBot::Syntax::Methods

  config.include Paperclip::Shoulda::Matchers

  config.include Shoulda::Matchers::ActiveModel,  type: :model
  config.include Shoulda::Matchers::ActiveRecord, type: :model
end
