require "simplecov"
SimpleCov.start

if ENV["CI"]
  require "codeclimate-test-reporter"
  CodeClimate::TestReporter.start
end

require "syoboi_calendar"
require "webmock/rspec"

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.filter_run :focus
end
