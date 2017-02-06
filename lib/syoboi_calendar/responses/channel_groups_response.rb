module SyoboiCalendar
  module Responses
    class ChannelGroupsResponse < BaseResponse
      # @note Override
      def resources
        ::Array.wrap(faraday_response.body.ChGroupLookupResponse.ChGroupItems.ChGroupItem).map do |element|
          ::SyoboiCalendar::Resources::ChannelGroupResource.new(element)
        end
      end
    end
  end
end
