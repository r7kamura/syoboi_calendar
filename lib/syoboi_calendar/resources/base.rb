module SyoboiCalendar
  module Resources
    class Base
      # @return [Hashie::Mash]
      attr_reader :response

      # @param response [Hashie::Mash]
      def initialize(response)
        @response = response
      end

      # @return [Time]
      def updated_at
        Time.parse(response.LastUpdate)
      end
    end
  end
end
