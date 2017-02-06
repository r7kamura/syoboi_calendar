module SyoboiCalendar
  module Responses
    class TitlesResponse < BaseResponse
      private

      # @note Override
      def source_or_sources
        parsed_body["TitleLookupResponse"]["TitleItems"]["TitleItem"]
      end

      # @note Override
      def resource_class
        ::SyoboiCalendar::Resources::TitleResource
      end
    end
  end
end
