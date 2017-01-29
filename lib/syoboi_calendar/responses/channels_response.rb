module SyoboiCalendar
  module Responses
    class ChannelsResponse < BaseResponse
      # @note Override
      def resources
        ::Array.wrap(faraday_response.body.ChLookupResponse.ChItems.ChItem).map do |element|
          ::SyoboiCalendar::Resources::ChannelResource.new(element)
        end
      end
    end
  end
end
