module SyoboiCalendar
  class Program
    JSON_URL = "http://cal.syoboi.jp/json.php"

    EXT_PROGRAM_PARAM_MAP = {
      :channel_epd_url => "ChID",
      :channel_id      => "ChName",
      :channel_name    => "ChEPGURL",
      :comment         => "Count",
      :config_flag     => "StTime",
      :count           => "EdTime",
      :end_time        => "SubTitle2",
      :start_time      => "ProgComment",
      :subtitle        => "ConfFlag"
    }
    EXT_TITLE_PARAM_MAP = {
      :cat              => "Cat",
      :comment          => "Comment",
      :first_ch         => "FirstCh",
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

    def initialize(args)
      @pid   = args[:pid] or return
      @tid   = args[:tid] or return
      @title = args[:title]
      @blob  = {}
    end

    private

    # call update_detail when matched method is called
    def method_missing(name, *args)
      if EXT_PROGRAM_PARAM_MAP[name]
        unless @has_ext_program_params
          update_detail(:program)
          @has_ext_program_params = true
        end
        @blob[name]
      elsif EXT_TITLE_PARAM_MAP[name]
        unless @has_ext_title_params
          update_detail(:title)
          @has_ext_title_params = true
        end
        @blob[name]
      else
        super
      end
    end

    # get json and update @blob
    def update_detail(type)
      case type
      when :program
        url  = create_json_url(:Req => "ProgramByPID")
        hash = get_json(url)["Programs"][@pid.to_s]
        EXT_PROGRAM_PARAM_MAP.each { |k, v| @blob[k] = hash[v] }
      when :title
        url  = create_json_url(:Req => "TitleFull")
        hash = get_json(url)["Titles"][@tid.to_s]
        EXT_TITLE_PARAM_MAP.each { |k, v| @blob[k] = hash[v] }
      end
    end

    # request content to JSON API
    def get_json(url)
      JSON.parse(SyoboiCalendar.agent.get(url).content)
    end

    # create URL for get_json
    def create_json_url(opts)
      JSON_URL + "?" + {
        :Req => "ProgramByPID",
        :PID => @pid,
        :TID => @tid
      }.merge(opts).map { |k, v| "#{k}=#{v}" }.join("&")
    end
  end
end
