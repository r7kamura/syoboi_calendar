module SyoboiCalendar
  class Song
    # @return [String]
    attr_reader :name

    # @return [Array<SyoboiCalendar::Personality>]
    attr_reader :personalities

    # @return [String]
    attr_reader :role

    # @param name [String]
    # @param personalities [Array<SyoboiCalendar::Personality>]
    # @param role [String]
    def initialize(name:, personalities:, role:)
      @name = name
      @personalities = personalities
      @role = role
    end
  end
end
