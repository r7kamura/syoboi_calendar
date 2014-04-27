module SyoboiCalendar
  module Queries
    class Base
      attr_reader :options

      def initialize(options = {})
        @options = options
      end
    end
  end
end
