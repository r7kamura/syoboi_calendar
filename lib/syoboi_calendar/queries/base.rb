require "active_support/core_ext/string/inflections"

module SyoboiCalendar
  module Queries
    class Base
      class << self
        def properties
          @properties ||= []
        end

        def property(*properties)
          self.properties.concat(properties)
        end
      end

      attr_reader :options

      def initialize(options = {})
        @options = options
      end

      def to_hash
        properties.inject({}) do |hash, property|
          hash.merge(property => send(property.to_s.underscore))
        end
      end

      def properties
        self.class.properties
      end
    end
  end
end
