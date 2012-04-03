require "json"
require "bundler/setup"
Bundler.require(:default)

module SyoboiCalendar
  require "syoboi_calendar/agent"
  require "syoboi_calendar/program"
  require "syoboi_calendar/client"
end
