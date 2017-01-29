module SyoboiCalendar
  module Responses
    class BaseResponse
      include ::Enumerable

      # @param faraday_response [Faraday::Response]
      def initialize(faraday_response)
        @faraday_response = faraday_response
      end

      # @note Override
      def each
        resources.map do |resource|
          yield resource
        end
      end

      private

      # @return [Array<SyoboiCalendar::Resources::BaseResource>]
      def resources
        raise ::NotImplementedError
      end

      # @return [Faraday::Response]
      def faraday_response
        @faraday_response
      end
    end
  end
end
