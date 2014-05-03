module SyoboiCalendar
  module Parsers
    class Program < Base
      private

      def resource_class
        Resources::Program
      end

      def items
        Array.wrap(response.ProgLookupResponse.ProgItems.ProgItem)
      end
    end
  end
end
