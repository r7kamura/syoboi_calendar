module SyoboiCalendar
  class CommentSection
    NAME_CASTS = "キャスト"
    NAME_STAFFS = "スタッフ"
    PATTERN_NAME_SONG_ENDING = /\Aエンディング\d*\s*「(.+)」\z/
    PATTERN_NAME_SONG_INSERTED = /\A挿入歌\d*\s*「(.+)」\z/
    PATTERN_NAME_SONG_OPENING = /\Aオープニング\d*\s*「(.+)」\z/
    PATTERN_NAME_SONG_THEME = /\A主題歌\d*\s*「(.+)」\z/

    attr_reader :source

    # @param source [String]
    def initialize(source)
      @source = source
    end

    # @return [Boolean]
    def about_song_ending?
      PATTERN_NAME_SONG_ENDING === name
    end

    # @return [Boolean]
    def about_song_inserted?
      PATTERN_NAME_SONG_INSERTED === name
    end

    # @return [Boolean]
    def about_song_opening?
      PATTERN_NAME_SONG_OPENING === name
    end

    # @return [Boolean]
    def about_song_theme?
      PATTERN_NAME_SONG_THEME === name
    end

    # @return [Boolean]
    def about_casts?
      name == NAME_CASTS
    end

    # @return [Boolean]
    def about_personalities?
      about_casts? || about_staffs?
    end

    # @return [Boolean]
    def about_staffs?
      name == NAME_STAFFS
    end

    # @return [Array<String>]
    def array
      if lines[1][0] == "-"
        lines[1..-1].grep(/\A-/).map do |line|
          line[1..-1]
        end
      else
        lines
      end
    end

    # @return [Boolean]
    def has_hash?
      lines[1][0] == ":"
    end

    # @return [Hash{String => String}]
    def hash
      lines[1..-1].grep(/\A:/).each_with_object({}) do |line, result|
        key_or_keys, value = line[1..-1].split(":", 2)
        key_or_keys.split("・").each do |key|
          result[key] = value.split("、")
        end
      end
    end

    # @return [Array<String>]
    def lines
      source.strip.split("\n")
    end

    # @return [String]
    def name
      lines[0][1..-1]
    end

    # @return [Array, nil]
    def personalities
      if about_personalities?
        hash.flat_map do |role, sources|
          sources.map do |source|
            ::SyoboiCalendar::Personality.new(role: role, source: source)
          end
        end
      end
    end

    # @return [Hash]
    def song_attributes
      {
        name: name,
        source: hash,
      }
    end
  end
end
