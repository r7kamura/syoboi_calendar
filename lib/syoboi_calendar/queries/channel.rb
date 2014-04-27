module SyoboiCalendar
  module Queries
    class Channel < Base
      include ChannelIdQueriable

      private

      def command
        "ChLookup"
      end
    end
  end
end
