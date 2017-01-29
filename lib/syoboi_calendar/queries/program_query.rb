module SyoboiCalendar
  module Queries
    class ProgramQuery < BaseQuery
      COMMAND = "ProgLookup"

      JOIN = "SubTitles"

      property :ChID
      property :Count
      property :JOIN
      property :PID
      property :Range
      property :StTime

      # @return [Integer, nil]
      def ChID
        options[:channel_id]
      end

      # @note Override
      def Command
        COMMAND
      end

      # @return [Integer, nil]
      def Count
        options[:count]
      end

      # @return [String]
      def JOIN
        JOIN
      end

      # @return [Integer, nil]
      def PID
        options[:program_id]
      end

      # @return [String, nil]
      def Range
        format_time_range(options[:played_from], options[:played_to])
      end

      # @return [String, nil]
      def StTime
        format_time_range(options[:started_from], options[:started_to])
      end
    end
  end
end
