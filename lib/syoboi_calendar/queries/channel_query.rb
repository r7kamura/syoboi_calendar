module SyoboiCalendar
  module Queries
    class ChannelQuery < BaseQuery
      COMMAND = "ChLookup"

      property :ChID

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
    end
  end
end
