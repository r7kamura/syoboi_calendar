module SyoboiCalendar
  module QueryBuilders
    class Program < Base
      include ChannelIdQueriable

      option(
        :count,
        :program_id,
        :played_from,
        :played_to,
        :started_from,
        :started_to,
      )

      time_option(
        :played,
        :started,
      )

      property(
        :Count,
        :JOIN,
        :PID,
        :Range,
        :StTime,
      )

      alias pid program_id

      private

      def command
        "ProgLookup"
      end

      def join
        "SubTitles"
      end

      def range
        "#{formatted_played_from}-#{formatted_played_to}" if has_played_time?
      end

      def st_time
        "#{formatted_started_from}-#{formatted_started_to}" if has_started_time?
      end
    end
  end
end
