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
      property :TID

      # @return [String, nil]
      def ChID
        if options[:channel_id]
          format_comma_separated_values(options[:channel_id])
        end
      end

      # @note Override
      def Command
        COMMAND
      end

      # @return [String, nil]
      def Count
        if options[:count]
          format_comma_separated_values(options[:count])
        end
      end

      # @return [String]
      def JOIN
        JOIN
      end

      # @return [String, nil]
      def PID
        if options[:program_id]
          format_comma_separated_values(options[:program_id])
        end
      end

      # @return [String, nil]
      def Range
        format_time_range(options[:played_from], options[:played_to])
      end

      # @return [String, nil]
      def StTime
        format_time_range(options[:started_from], options[:started_to])
      end

      # @return [String, nil]
      def TID
        if options[:title_id]
          format_comma_separated_values(options[:title_id])
        end
      end
    end
  end
end
