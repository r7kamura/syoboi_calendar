require "active_support/core_ext/object/to_query"
require "active_support/core_ext/string/strip"
require "syoboi_calendar"
require "webmock/rspec"

RSpec.configure do |config|
  config.run_all_when_everything_filtered = true
  config.filter_run :focus
end
