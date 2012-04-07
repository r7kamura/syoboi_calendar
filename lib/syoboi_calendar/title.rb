# encoding: UTF-8

module SyoboiCalendar
  class Title
    attr_reader(
      :tid,
      :name,
    )

    # (1) :method_name => "NameInSyoboiCalendarResponse"
    # (2) :method_name => ["NameInSyoboiCalendarResponse", callback]
    EXT_PARAM_MAP = {
      :cat              => "Cat",
      :comment          => "Comment",
      :first_channel    => "FirstCh",
      :first_end_month  => "FirstEndMonth",
      :first_end_year   => "FirstEndYear",
      :first_month      => "FirstMonth",
      :first_year       => "FirstYear",
      :keywords         => "Keywords",
      :short_title      => "ShortTitle",
      :subtitles        => "SubTitles",
      :title_en         => "TitleEN",
      :title_flag       => "TitleFlag",
      :title_view_count => "TitleViewCount",
      :title_yomi       => "TitleYomi",
      :user_point       => "UserPoint",
      :user_point_rank  => "UserPointRank"
    }

    # Example:
    #   title.first_channel
    #   title.keywords
    #   ...
    EXT_PARAM_MAP.keys.each do |key|
      define_method(key) do
        update_detail unless @blob.has_key?(key)
        @blob[key]
      end
    end

    # NOTICE: @blob is empty hash at first
    # For example,
    #   If self.channel_name is called,
    #   then update_detail is called automatically,
    #   and @blob is updated to fill up @blob[:channel_name]
    def initialize(args)
      @tid  = args[:tid]
      @name = args[:name]
      @blob = {}
    end

    def voice_actors
      voice_actor_map.values
    end

    def characters
      voice_actor_map.keys
    end

    def voice_actor_map
      @voice_actor_map ||= begin
        update_detail_from_comment
        @voice_actor_map
      end
    end

    def url
      @url ||= begin
        update_detail_from_comment
        @url
      end
    end

    private

    # update params from detail data
    def update_detail
      hash = get_detail
      EXT_PARAM_MAP.each do |k, v|
        if v.kind_of?(Array)
          @blob[k] = v[1].call(hash[v[0]])
        else
          @blob[k] = hash[v]
        end
      end
    end

    # request detail data
    def get_detail
      hash = self.class.agent.json(
        :Req => "TitleFull",
        :TID => @tid
      )
      hash = hash[hash.keys.first]
      hash = hash[hash.keys.first]
      hash
    end

    def self.agent
      @agent ||= Agent.new
    end

    def update_detail_from_comment
      hash             = parse_comment
      @url             = hash[:url]
      @voice_actor_map = hash[:voice_actor_map]
    end

    def parse_comment
      {
        :url             => extract_url,
        :voice_actor_map => extract_voice_actor_map,
      }
    end

    # first url is selected as official url
    def extract_url
      URI.extract(comment, %w[http https])[0]
    end

    # cast is like following format
    # *{section1}:key1:val1\r\n:key2:val2\r\n
    # *{section2}:key1:val1\r\n:key2:val2\r\n
    def extract_voice_actor_map
      sections = comment.split(/^\*/)
      section = sections.select { |sec| sec =~ /^キャスト/ }[0]
      lines = section.split(/\r\n/)
      lines.inject({}) do |hash, line|
        _, character, actor = line.split(/:/)
        hash[character] = actor if character && actor
        hash
      end
    end
  end
end
