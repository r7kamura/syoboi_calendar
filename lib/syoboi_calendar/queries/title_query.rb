module SyoboiCalendar
  module Queries
    class TitleQuery < BaseQuery
      COMMAND = "TitleLookup"

      property :TID

      # @note Override
      def Command
        COMMAND
      end

      # @return [String]
      def TID
        if options[:title_id]
          format_comma_separated_values(options[:title_id])
        else
          "*"
        end
      end
    end
  end
end
