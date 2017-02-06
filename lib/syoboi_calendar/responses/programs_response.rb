module SyoboiCalendar
  module Responses
    class ProgramsResponse < BaseResponse
      private

      # @note Override
      def source_or_sources
        parsed_body["ProgLookupResponse"]["ProgItems"]["ProgItem"]
      end

      # @note Override
      def resource_class
        ::SyoboiCalendar::Resources::ProgramResource
      end
    end
  end
end
