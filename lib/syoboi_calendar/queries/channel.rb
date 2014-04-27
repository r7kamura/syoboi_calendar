module SyoboiCalendar
  module Queries
    class Channel < Base
      include ChannelIdQueriable
      include UpdatedTimeQueriable

      private

      def command
        "ChLookup"
      end
    end
  end
end
