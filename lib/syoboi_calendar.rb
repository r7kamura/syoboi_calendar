require "json"
require "bundler/setup"
Bundler.require(:default)

module SyoboiCalendar
  BASE_URL   = "http://cal.syoboi.jp"
  LOGIN_URL  = BASE_URL + "/usr"
  SEARCH_URL = BASE_URL + "/find"

  require "syoboi_calendar/core"
  require "syoboi_calendar/program"
  require "syoboi_calendar/client"

  extend Core
end
