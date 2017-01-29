module SyoboiCalendar
  module Responses
    class TitlesResponse < BaseResponse
      # @note Override
      def resources
        ::Array.wrap(faraday_response.body.TitleLookupResponse.TitleItems.TitleItem).map do |element|
          ::SyoboiCalendar::Resources::TitleResource.new(element)
        end
      end
    end
  end
end
