module SyoboiCalendar
  module Responses
    class ChannelsResponse < BaseResponse
      private

      # @note Override
      def source_or_sources
        parsed_body["ChLookupResponse"]["ChItems"]["ChItem"]
      end

      # @note Override
      def resource_class
        ::SyoboiCalendar::Resources::ChannelResource
      end
    end
  end
end
