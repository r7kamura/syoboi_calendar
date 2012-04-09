$LOAD_PATH.unshift File.expand_path("../", __FILE__)
$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)

require "simplecov"
SimpleCov.start

require "syoboi_calendar"
require "webmock/rspec"


module SyoboiCalendar::Fixture
  extend self

  FIXTURE_DIR = File.expand_path("../fixtures", __FILE__)

  private

  def method_missing(method_name, *args)
    cache[method_name] ||= begin
      path = "#{FIXTURE_DIR}/#{method_name}"
      File.exist?(path) ? cache[method_name] = File.read(path) : nil
    end
  end

  def cache
    @cache ||= {}
  end
end
