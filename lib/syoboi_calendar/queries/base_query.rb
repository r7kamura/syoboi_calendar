module SyoboiCalendar
  module Queries
    class BaseQuery
      class << self
        attr_writer :property_names

        # @note Override
        def inherited(child_class)
          child_class.property_names = property_names.clone
        end

        # @return [Array<Symbol>]
        def property_names
          @property_names ||= []
        end

        # @param property_name [Symbol]
        def property(property_name)
          property_names << property_name
        end
      end

      property :Command
      property :LastUpdate

      def initialize(options = {})
        @options = options
      end

      # @return [String]
      def Command
        raise ::NotImplementedError
      end

      # @return [String, nil]
      def LastUpdate
        format_time_range(options[:updated_from], options[:updated_to])
      end

      # @return [Hash]
      def to_hash
        self.class.property_names.each_with_object({}) do |property_name, result|
          value = send(property_name)
          unless value.nil?
            result[property_name.to_s] = value
          end
        end
      end

      private

      # @param value_or_values [Array, Integer, String]
      # @return [String]
      def format_comma_separated_values(value_or_values)
        Array(value_or_values).join(",")
      end

      # @param [Time, nil]
      # @return [String]
      def format_time(time)
        if time
          time.strftime("%Y%m%d_%H%M%S")
        end
      end

      # @param started_at [Time, nil]
      # @param finished_at [Time, nil]
      def format_time_range(started_at, finished_at)
        if started_at || finished_at
          [
            format_time(started_at),
            format_time(finished_at),
          ].join("-")
        end
      end

      # @return [Hash]
      def options
        @options
      end
    end
  end
end
