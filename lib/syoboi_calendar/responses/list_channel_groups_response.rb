module SyoboiCalendar
  module Responses
    class ListChannelGroupsResponse < BaseResponse
      private

      # @note Override
      def resource_class
        ::SyoboiCalendar::Resources::ChannelGroupResource
      end

      # @note Override
      def response_key
        "ChGroupLookupResponse"
      end

      # @note Override
      def source_or_sources
        body[response_key]["ChGroupItems"]["ChGroupItem"]
      end
    end
  end
end
