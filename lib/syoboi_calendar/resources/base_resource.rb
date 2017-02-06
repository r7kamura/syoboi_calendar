module SyoboiCalendar
  module Resources
    class BaseResource
      class << self
        attr_writer :property_names

        # @note Override
        def inherited(child_class)
          child_class.property_names = property_names.clone
        end

        # @param property_name [Symbol]
        def property(property_name)
          property_names << property_name
        end

        # @return [Array<Symbol>]
        def property_names
          @property_names ||= []
        end
      end

      property :updated_at

      # @param source [Hash]
      def initialize(source)
        @source = source
      end

      # @return [Hash]
      def to_hash
        self.class.property_names.each_with_object({}) do |property_name, object|
          object[property_name] = send(property_name)
        end
      end

      # @return [Time, nil]
      def updated_at
        if source["LastUpdate"]
          ::Time.parse(source["LastUpdate"])
        end
      end

      private

      # @return [Hash]
      def source
        @source
      end
    end
  end
end
