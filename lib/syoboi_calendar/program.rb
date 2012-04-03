module SyoboiCalendar
  class Program
    EXT_PROGRAM_PARAM_MAP = {
      :channel_epd_url => "ChEPGURL",
      :channel_id      => "ChID",
      :channel_name    => "ChName",
      :comment         => "ConfFlag",
      :config_flag     => "Count",
      :count           => "EdTime",
      :end_time        => "ProgComment",
      :start_time      => "StTime",
      :subtitle        => "SubTitle2"
    }
    EXT_TITLE_PARAM_MAP = {
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

    attr_reader(
      :pid,
      :tid,
      :title
    )

    # NOTICE: @blob is empty hash at first
    # For example,
    #   When self.channel_name is called,
    #   update_detail is called automatically
    #   and @blob is updated to fill up @blob[:channel_name]
    def initialize(args)
      @pid   = args[:pid] or return
      @tid   = args[:tid] or return
      @title = args[:title]
      @blob  = {}
    end

    # get more detail of the program and update @blob
    def update_detail(type)
      case type
      when :program
        return if @has_ext_program_params
        hash = get_json(:Req => "ProgramByPID")["Programs"][@pid.to_s]
        EXT_PROGRAM_PARAM_MAP.each { |k, v| @blob[k] = hash[v] }
        @has_ext_program_params = true
      when :title
        return if @has_ext_title_params
        hash = get_json(:Req => "TitleFull")["Titles"][@tid.to_s]
        EXT_TITLE_PARAM_MAP.each { |k, v| @blob[k] = hash[v] }
        @has_ext_title_params = true
      end
    end

    def is_saisoku?
      channel_name.match(first_channel) or first_channel.match(channel_name)
    end

    private

    # call update_detail if method name matches param name
    def method_missing(name, *args)
      if EXT_PROGRAM_PARAM_MAP[name]
        update_detail(:program)
        @blob[name]
      elsif EXT_TITLE_PARAM_MAP[name]
        update_detail(:title)
        @blob[name]
      else
        super
      end
    end

    # adjust query and get parsed json data
    def get_json(opts)
      Agent.json({
        :Req => "ProgramByPID",
        :PID => @pid,
        :TID => @tid
      }.merge(opts))
    end
  end
end
