# frozen_string_literal: true

require 'simplecov'
require 'capybara/rspec'
require_relative './vcr/init'
Dir['./spec/shared_examples/**/*.rb'].each { |shared_example| require shared_example }
Dir['./spec/shared_contexts/**/*.rb'].each { |shared_context| require shared_context }
SimpleCov.start(:rails)
RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
  config.profile_examples = 5
  config.order = :defined
  config.define_derived_metadata do |meta|
    meta[:aggregate_failures] = true
  end
end
