module SyoboiCalendar
  class Comment
    PATTERN_SPLITTING_SECTIONS = /\n{1,2}(?=\*(?!\*))/

    # @return [String]
    attr_reader :source

    # @param source [String]
    def initialize(source)
      @source = source
    end

    # @return [Array<SyoboiCalendar::Personality>]
    def casts
      if comment_section = comment_sections.find(&:about_casts?)
        comment_section.personalities
      else
        []
      end
    end

    # @return [Array<SyoboiCalendar::CommentSection>]
    def comment_sections
      source.split(PATTERN_SPLITTING_SECTIONS).map do |comment_section_source|
        ::SyoboiCalendar::CommentSection.new(comment_section_source)
      end
    end

    # @return [Array<SyoboiCalendar::Song>]
    def songs_ending
      comment_sections.select(&:about_song_ending?).map do |comment_section|
        ::SyoboiCalendar::Song.new(comment_section.song_attributes)
      end
    end

    # @return [Array<SyoboiCalendar::Song>]
    def songs_inserted
      comment_sections.select(&:about_song_inserted?).map do |comment_section|
        ::SyoboiCalendar::Song.new(comment_section.song_attributes)
      end
    end

    # @return [Array<SyoboiCalendar::Song>]
    def songs_opening
      comment_sections.select(&:about_song_opening?).map do |comment_section|
        ::SyoboiCalendar::Song.new(comment_section.song_attributes)
      end
    end

    # @return [Array<SyoboiCalendar::Song>]
    def songs_theme
      comment_sections.select(&:about_song_theme?).map do |comment_section|
        ::SyoboiCalendar::Song.new(comment_section.song_attributes)
      end
    end

    # @return [Array<SyoboiCalendar::Personality>]
    def staffs
      if comment_section = comment_sections.find(&:about_staffs?)
        comment_section.personalities
      else
        []
      end
    end
  end
end
