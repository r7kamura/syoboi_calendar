module SyoboiCalendar
  module Queries
    class Base
      class << self
        def build(options)
          new(options).to_hash
        end

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

        def time_option(*names)
          names.each do |name|
            define_method("has_#{name}_time?") do
              !!(send("#{name}_from") || send("#{name}_to"))
            end

            define_method("formatted_#{name}_from") do
              send("#{name}_from").try(:strftime, "%Y%m%d_%H%M%S")
            end

            define_method("formatted_#{name}_to") do
              send("#{name}_to").try(:strftime, "%Y%m%d_%H%M%S")
            end
          end
        end
      end

      class_attribute :properties

      self.properties = []

      option(
        :updated_from,
        :updated_to,
      )

      time_option(
        :updated,
      )

      property(
        :Command,
        :LastUpdate,
      )

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

      def last_update
        "#{formatted_updated_from}-#{formatted_updated_to}" if has_updated_time?
      end
    end
  end
end
