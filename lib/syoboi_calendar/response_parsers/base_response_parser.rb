module SyoboiCalendar
  module ResponseParsers
    class BaseResponseParser
      # @param body [String]
      def initialize(body)
        @body = body
      end

      # @return [Array<SyoboiCalendar::Resources::BaseResource>]
      def parse
        sources.map do |source|
          resource_class.new(source)
        end
      end

      private

      # @return [String]
      def body
        @body
      end

      # @return [Hash]
      def parsed_body
        ::MultiXml.parse(body)
      end

      # @return [Class]
      def resource_class
        raise ::NotImplementedError
      end

      # @return [Array<Hash>, Hash]
      def source_or_sources
        raise ::NotImplementedError
      end

      # @return [Array]
      def sources
        object = source_or_sources
        case
        when object.nil?
          []
        when object.respond_to?(:to_ary)
          object.to_ary || [object]
        else
          [object]
        end
      end
    end
  end
end
