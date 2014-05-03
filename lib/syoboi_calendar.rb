require "active_support/concern"
require "active_support/core_ext/class/attribute"
require "active_support/core_ext/object/try"
require "active_support/core_ext/string/inflections"
require "faraday"
require "faraday_middleware"

require "syoboi_calendar/client"
require "syoboi_calendar/connector"
require "syoboi_calendar/queries/base"
require "syoboi_calendar/queries/channel_id_queriable"
require "syoboi_calendar/queries/channel"
require "syoboi_calendar/queries/program"
require "syoboi_calendar/queries/title"
