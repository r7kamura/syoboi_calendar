module SyoboiCalendar
  module Responses
    class ChannelsResponse < BaseResponse
      private

      # @note Override
      def resource_class
        ::SyoboiCalendar::Resources::ChannelResource
      end

      # @note Override
      def response_key
        "ChLookupResponse"
      end

      # @note Override
      def source_or_sources
        body[response_key]["ChItems"]["ChItem"]
      end
    end
  end
end
