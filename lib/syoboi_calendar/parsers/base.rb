module SyoboiCalendar
  module Parsers
    class Base
      class << self
        def parse(response)
          new(response).parse
        end
      end

      attr_reader :response

      def initialize(response)
        @response = response
      end

      def parse
        items.map do |item|
          resource_class.new(item)
        end
      rescue NoMethodError
        []
      end
    end
  end
end
