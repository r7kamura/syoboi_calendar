module SyoboiCalendar
  module Queries
    class Title < Base
      property :Command

      private

      def command
        "TitleLookup"
      end
    end
  end
end
