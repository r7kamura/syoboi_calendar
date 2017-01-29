module SyoboiCalendar
  module Parsers
    class Channel < Base
      private

      def resource_class
        Resources::Channel
      end

      def items
        ::Array.wrap(response.ChLookupResponse.ChItems.ChItem)
      end
    end
  end
end
