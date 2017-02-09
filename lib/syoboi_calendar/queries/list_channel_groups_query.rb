module SyoboiCalendar
  module Queries
    class ListChannelGroupsQuery < BaseQuery
      COMMAND = "ChGroupLookup"

      property :ChGID

      # @return [String, nil]
      def ChGID
        if options[:channel_group_id]
          format_comma_separated_values(options[:channel_group_id])
        end
      end

      # @note Override
      def Command
        COMMAND
      end
    end
  end
end
