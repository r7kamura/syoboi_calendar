module SyoboiCalendar
  module Queries
    class Base
      class << self
        def property(*properties)
          self.properties += properties
        end

        def option(*options)
          options.each do |option|
            define_method(option) do
              self.options[option]
            end
          end
        end
      end

      class_attribute :properties

      self.properties = []

      property :Command

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
