module SyoboiCalendar
  module Queries
    class Channel < Base
      property :Command

      private

      def command
        "ChLookup"
      end
    end
  end
end
