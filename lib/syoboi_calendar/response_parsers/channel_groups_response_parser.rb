module SyoboiCalendar
  module ResponseParsers
    class ChannelGroupsResponseParser < BaseResponseParser
      private

      # @note Override
      def resource_class
        ::SyoboiCalendar::Resources::ChannelGroupResource
      end

      # @note Override
      def source_or_sources
        parsed_body["ChGroupLookupResponse"]["ChGroupItems"]["ChGroupItem"]
      end
    end
  end
end
