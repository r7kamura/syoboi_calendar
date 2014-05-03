module SyoboiCalendar
  module Processors
    class Title < Base
      private

      def query_builder
        QueryBuilders::Title
      end

      def parser
        Parsers::Title
      end
    end
  end
end
