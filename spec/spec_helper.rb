require "simplecov"
SimpleCov.start

require "webmock/rspec"

if ENV["CI"]
  WebMock.disable_net_connect!(allow: "codeclimate.com")
  require "codeclimate-test-reporter"
  CodeClimate::TestReporter.start
end

require "syoboi_calendar"

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.filter_run :focus
end
