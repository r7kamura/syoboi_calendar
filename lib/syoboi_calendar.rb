# gems
require "mechanize"

# libraries
require "syoboi_calendar/agent"
require "syoboi_calendar/client"
require "syoboi_calendar/program"
require "syoboi_calendar/title"
require "syoboi_calendar/version"

class SyoboiCalendar
  include SyoboiCalendar::Client
end
