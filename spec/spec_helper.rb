require 'factory_girl_rails'
require 'database_cleaner'

RSpec.configure do |config|

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.include FactoryGirl::Syntax::Methods

  config.order = 'random'
  config.color = true
  config.formatter = :documentation

  config.before(:suite) do
    DatabaseCleaner.orm = :mongoid
    DatabaseCleaner.strategy = :truncation
  end

  config.before(:each) { DatabaseCleaner[:mongoid].start }
  config.after(:each) { DatabaseCleaner[:mongoid].clean }
end
