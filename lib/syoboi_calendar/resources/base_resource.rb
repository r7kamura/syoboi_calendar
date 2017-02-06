module SyoboiCalendar
  module Resources
    class BaseResource
      # @param source [Hash]
      def initialize(source)
        @source = source
      end

      # @return [Time, nil]
      def updated_at
        if source["LastUpdate"]
          ::Time.parse(source["LastUpdate"])
        end
      end

      private

      # @return [Hash]
      def source
        @source
      end
    end
  end
end
