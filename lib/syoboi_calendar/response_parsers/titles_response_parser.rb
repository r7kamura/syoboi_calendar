module SyoboiCalendar
  module ResponseParsers
    class TitlesResponseParser < BaseResponseParser
      private

      # @note Override
      def resource_class
        ::SyoboiCalendar::Resources::TitleResource
      end

      # @note Override
      def source_or_sources
        parsed_body["TitleLookupResponse"]["TitleItems"]["TitleItem"]
      end
    end
  end
end
