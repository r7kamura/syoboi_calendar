module SyoboiCalendar
  module Parsers
    class Title < Base
      private

      def resource_class
        Resources::Title
      end

      def items
        Array.wrap(response.TitleLookupResponse.TitleItems.TitleItem)
      end
    end
  end
end
