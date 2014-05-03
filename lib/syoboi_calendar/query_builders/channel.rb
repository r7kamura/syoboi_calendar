module SyoboiCalendar
  module QueryBuilders
    class Channel < Base
      include ChannelIdQueriable

      private

      def command
        "ChLookup"
      end
    end
  end
end
