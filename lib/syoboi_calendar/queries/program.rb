module SyoboiCalendar
  module Queries
    class Program < Base
      def to_hash
        super.merge(JOIN: "SubTitles")
      end

      def command
        "ProgLookup"
      end
    end
  end
end
