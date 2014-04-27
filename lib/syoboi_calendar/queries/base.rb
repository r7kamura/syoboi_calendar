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
        to_hash_with_nil_value.reject {|key, value| value.nil? }
      end

      def to_hash_with_nil_value
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
