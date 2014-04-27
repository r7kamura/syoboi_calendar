module SyoboiCalendar
  module Queries
    class Program < Base
      include ChannelIdQueriable

      option(
        :count,
        :pid,
        :played_from,
        :played_to,
        :started_from,
        :started_to,
      )

      property(
        :Count,
        :JOIN,
        :PID,
        :Range,
        :StTime,
      )

      private

      def command
        "ProgLookup"
      end

      def join
        "SubTitles"
      end

      def range
        "#{played_from}-#{played_to}" if has_played_time?
      end

      def st_time
        "#{started_from}-#{started_to}" if has_started_time?
      end

      def has_played_time?
        !!(played_from || played_to)
      end

      def has_started_time?
        !!(started_from || started_to)
      end
    end
  end
end
