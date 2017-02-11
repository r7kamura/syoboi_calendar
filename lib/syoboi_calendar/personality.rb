module SyoboiCalendar
  class Personality
    # @return [String]
    attr_reader :role

    # @param role [String]
    # @param source [String]
    def initialize(role:, source:)
      @role = role
      @source = source
    end

    # @return [String]
    def name
      source.sub(/\(.+\)/, "")
    end

    # @return [String, nil]
    def name_annotation
      source[/\((.+)\)/, 1]
    end

    private

    # @private
    # @return [String]
    def source
      @source
    end
  end
end
