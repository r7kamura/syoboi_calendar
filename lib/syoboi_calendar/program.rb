module SyoboiCalendar
  class Program
    JSON_URL = "http://cal.syoboi.jp/json.php"
    EXT_PARAM_MAP = {
      :channel_id      => 1,
      :channel_name    => 1,
      :channel_epd_url => 1,
      :count           => 1,
      :start_time      => 1,
      :end_time        => 1,
      :subtitle        => 1,
      :comment         => 1,
      :config_flag     => 1
    }

    attr_reader(
      :pid,
      :tid,
      :title
    )

    def self.agent
      @agent ||= Mechanize.new
    end

    def initialize(args)
      @pid       = args[:pid] or return
      @tid       = args[:tid]
      @title     = args[:title]
      @blob      = {}
      @is_called = false
    end

    def method_missing(name, *args)
      if EXT_PARAM_MAP[name]
        unless @is_called
          get_detail
          @is_called = true
        end
        @blob[name]
      else
        super
      end
    end

    private

    def get_detail
      hash = get_json(create_json_url)["Programs"][@pid.to_s]
      @blob = {
        :channel_id      => hash["ChID"],
        :channel_name    => hash["ChName"],
        :channel_epd_url => hash["ChEPGURL"],
        :count           => hash["Count"],
        :start_time      => hash["StTime"],
        :end_time        => hash["EdTime"],
        :subtitle        => hash["SubTitle2"],
        :comment         => hash["ProgComment"],
        :config_flag     => hash["ConfFlag"]
      }
    end

    def get_json(url)
      JSON.parse(self.class.agent.get(url).content)
    end

    def create_json_url
      JSON_URL + "?" + {
        :Req => "ProgramByPID",
        :PID => @pid
      }.map { |k, v| "#{k}=#{v}" }.join("&")
    end
  end
end
