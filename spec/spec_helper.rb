require "capybara"
require "capybara/rspec"
require "rspec"
require "simplecov"
require "simplecov-console"
require "features/web_helpers"
require "setup_test_database"

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
])
SimpleCov.start

ENV["RACK_ENV"] = "test"
ENV["ENVIRONMENT"] = "test"

require File.join(File.dirname(__FILE__), "..", "app.rb")

Capybara.app = MakersBnb

RSpec.configure do |config|
  config.before(:each) do
    setup_test_database
  end
end

# Do not remove - from original file
RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
end
