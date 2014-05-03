module SyoboiCalendar
  module Processors
    class Channel < Base
      private

      def query_builder
        QueryBuilders::Channel
      end

      def parser
        Parsers::Channel
      end
    end
  end
end
