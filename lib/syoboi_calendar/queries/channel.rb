module SyoboiCalendar
  module Queries
    class Channel < Base
      def command
        "ChLookup"
      end
    end
  end
end
