module SyoboiCalendar
  module Queries
    class ChannelQuery < BaseQuery
      COMMAND = "ChLookup"

      property :ChID

      # @return [String, nil]
      def ChID
        options[:channel_id]
      end

      # @note Override
      def Command
        COMMAND
      end
    end
  end
end
