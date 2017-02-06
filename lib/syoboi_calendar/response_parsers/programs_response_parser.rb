module SyoboiCalendar
  module ResponseParsers
    class ProgramsResponseParser < BaseResponseParser
      private

      # @note Override
      def resource_class
        ::SyoboiCalendar::Resources::ProgramResource
      end

      # @note Override
      def source_or_sources
        parsed_body["ProgLookupResponse"]["ProgItems"]["ProgItem"]
      end
    end
  end
end
