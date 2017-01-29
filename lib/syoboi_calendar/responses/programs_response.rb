module SyoboiCalendar
  module Responses
    class ProgramsResponse < BaseResponse
      # @note Override
      def resources
        ::Array.wrap(faraday_response.body.ProgLookupResponse.ProgItems.ProgItem).map do |element|
          ::SyoboiCalendar::Resources::ProgramResource.new(element)
        end
      end
    end
  end
end
