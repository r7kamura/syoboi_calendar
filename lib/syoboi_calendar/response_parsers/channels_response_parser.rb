module SyoboiCalendar
  module ResponseParsers
    class ChannelsResponseParser < BaseResponseParser
      private

      # @note Override
      def resource_class
        ::SyoboiCalendar::Resources::ChannelResource
      end

      # @note Override
      def source_or_sources
        parsed_body["ChLookupResponse"]["ChItems"]["ChItem"]
      end
    end
  end
end
