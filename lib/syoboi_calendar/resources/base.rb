module SyoboiCalendar
  module Resources
    class Base
      attr_reader :response

      def initialize(response)
        @response = response
      end

      def updated_at
        Time.parse(response.LastUpdate)
      end
    end
  end
end
