module SyoboiCalendar
  module Responses
    class ChannelGroupsResponse < BaseResponse
      private

      # @note Override
      def source_or_sources
        parsed_body["ChGroupLookupResponse"]["ChGroupItems"]["ChGroupItem"]
      end

      # @note Override
      def resource_class
        ::SyoboiCalendar::Resources::ChannelGroupResource
      end
    end
  end
end
