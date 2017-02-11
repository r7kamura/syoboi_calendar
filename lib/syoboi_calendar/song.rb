module SyoboiCalendar
  class Song
    KEY_ARRANGERS = "編曲"
    KEY_COMPOSERS = "作曲"
    KEY_LYRIC_WRITERS = "作詞"

    # @return [String]
    attr_reader :name

    # @param name [String]
    # @param source [Hash]
    def initialize(name:, source:)
      @name = name
      @source = source
    end

    # @return [Array<String>]
    def arrangers
      source[KEY_ARRANGERS]
    end

    # @return [Array<String>]
    def composers
      source[KEY_COMPOSERS]
    end

    # @return [Array<String>]
    def lyric_writers
      source[KEY_LYRIC_WRITERS]
    end

    private

    # @private
    # @return [Hash]
    def source
      @source
    end
  end
end
