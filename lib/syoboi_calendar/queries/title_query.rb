module SyoboiCalendar
  module Queries
    class TitleQuery < BaseQuery
      COMMAND = "TitleLookup"

      property :TID

      # @note Override
      def Command
        COMMAND
      end

      # @return [Integer, String]
      def TID
        options[:title_id] || "*"
      end
    end
  end
end
