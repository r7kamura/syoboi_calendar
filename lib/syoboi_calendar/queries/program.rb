module SyoboiCalendar
  module Queries
    class Program < Base
      property :Command, :JOIN

      private

      def command
        "ProgLookup"
      end

      def join
        "SubTitles"
      end
    end
  end
end
