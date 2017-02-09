module SyoboiCalendar
  module Responses
    class ProgramsResponse < BaseResponse
      private

      # @note Override
      def resource_class
        ::SyoboiCalendar::Resources::ProgramResource
      end

      # @note Override
      def source_or_sources
        body["ProgLookupResponse"]["ProgItems"]["ProgItem"]
      end
    end
  end
end
