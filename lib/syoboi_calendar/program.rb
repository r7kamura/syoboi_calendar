module SyoboiCalendar
  class Program
    attr_reader(
      :pid,
      :tid,
      :title
    )

    # need to request JSON API as query parameter
    REQ_MAP = {
      :program => "ProgramByPID",
      :title   => "TitleFull"
    }

    # :method_name => "NameInSyoboiCalendarResponse"
    EXT_PARAM_MAP = {
      :program => {
        :channel_epd_url => "ChEPGURL",
        :channel_id      => "ChID",
        :channel_name    => "ChName",
        :comment         => "ConfFlag",
        :config_flag     => "Count",
        :count           => "EdTime",
        :end_time        => "ProgComment",
        :start_time      => "StTime",
        :subtitle        => "SubTitle2"
      },
      :title => {
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
    }

    # Example:
    #   program.first_channel
    #   program.start_time
    #   ...
    [:program, :title].each do |type|
      EXT_PARAM_MAP[type].keys.each do |key|
        define_method(key) do
          update_detail(type) unless @blob.has_key?(key)
          @blob[key]
        end
      end
    end

    # NOTICE: @blob is empty hash at first
    # For example,
    #   If self.channel_name is called,
    #   then update_detail is called automatically,
    #   and @blob is updated to fill up @blob[:channel_name]
    def initialize(args)
      @pid   = args[:pid] or return
      @tid   = args[:tid] or return
      @title = args[:title]
      @blob  = {}
    end

    # SAISOKU means "the most earliest broadcasting in the World"
    def is_saisoku?
      channel_name.match(first_channel) or first_channel.match(channel_name)
    end

    # get more detail of the program and update @blob
    def update_detail(type)
      hash = Agent.json(:Req => REQ_MAP[type], :PID => @pid, :TID => @tid)
      hash = hash[hash.keys.first]
      hash = hash[hash.keys.first]
      EXT_PARAM_MAP[type].each { |k, v| @blob[k] = hash[v] }
    end
  end
end
