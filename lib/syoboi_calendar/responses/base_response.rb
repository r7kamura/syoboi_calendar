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

      # @return [Integer]
      def code
        body[response_key]["Result"]["Code"].to_i
      end

      # @note Implementation for Enumerable
      def each(&block)
        resources.each(&block)
      end

      # @return [Boolean]
      def has_error?
        code != 200
      end

      # @return [Faraday::Utils::Headers]
      def headers
        faraday_response.headers
      end

      # @return [String, nil]
      def message
        body[response_key]["Result"]["Message"]
      end

      # @return [Array<SyoboiCalendar::Resources::BaseResource>]
      def resources
        sources.map do |source|
          resource_class.new(source)
        end
      end

      # @return [Integer]
      def status
        faraday_response.status
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

      # @return [String]
      def response_key
        raise ::NotImplementedError
      end

      # @return [Array<Hash>, Hash]
      def source_or_sources
        raise ::NotImplementedError
      end

      # @return [Array<Hash>]
      def sources
        if has_error?
          []
        else
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
end
