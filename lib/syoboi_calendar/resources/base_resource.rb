module SyoboiCalendar
  module Resources
    class BaseResource
      # @return [Hash]
      attr_reader :source

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
    end
  end
end
