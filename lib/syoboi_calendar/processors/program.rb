module SyoboiCalendar
  module Processors
    class Program < Base
      def process
        include_title if specified_to_include_title?
        resources
      end

      private

      def query_builder
        QueryBuilders::Program
      end

      def parser
        Parsers::Program
      end
    end
  end
end
