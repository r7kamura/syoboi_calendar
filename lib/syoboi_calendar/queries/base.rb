module SyoboiCalendar
  module Queries
    class Base
      attr_reader :options

      def initialize(options = {})
        @options = options
      end

      def to_hash
        { Command: command }
      end
    end
  end
end
