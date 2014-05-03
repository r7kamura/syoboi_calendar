module SyoboiCalendar
  module Processors
    class Base
      class << self
        def process(*args)
          new(*args).process
        end
      end

      attr_reader :options

      def initialize(options)
        @options = options
      end

      def process
        resources
      end

      private

      def resources
        @resources ||= begin
          query = query_builder.build(options)
          response = get(query)
          parser.parse(response)
        end
      end

      def connector
        @connector ||= Connector.new
      end

      def get(query)
        connector.get(query).body
      end

      def includes
        options[:includes] || []
      end
    end
  end
end
