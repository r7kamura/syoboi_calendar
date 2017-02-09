module SyoboiCalendar
  module Responses
    class TitlesResponse < BaseResponse
      private

      # @note Override
      def resource_class
        ::SyoboiCalendar::Resources::TitleResource
      end

      # @note Override
      def response_key
        "TitleLookupResponse"
      end

      # @note Override
      def source_or_sources
        body[response_key]["TitleItems"]["TitleItem"]
      end
    end
  end
end
