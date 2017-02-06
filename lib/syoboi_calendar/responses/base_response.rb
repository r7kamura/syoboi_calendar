module SyoboiCalendar
  module Responses
    class BaseResponse
      include ::Enumerable

      # @param faraday_response [Faraday::Response]
      def initialize(faraday_response)
        @faraday_response = faraday_response
      end

      # @return [String]
      def body
        faraday_response.body
      end

      # @note Override
      def each
        resources.map do |resource|
          yield resource
        end
      end

      # @return [Hash]
      def parsed_body
        @parsed_body ||= ::MultiXml.parse(body)
      end

      private

      # @return [Faraday::Response]
      def faraday_response
        @faraday_response
      end

      # @return [Class]
      def resource_class
        raise ::NotImplementedError
      end

      # @return [Array<SyoboiCalendar::Resources::BaseResource>]
      def resources
        sources.map do |source|
          resource_class.new(source)
        end
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
