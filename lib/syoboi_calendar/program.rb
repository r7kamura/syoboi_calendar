module SyoboiCalendar
  class Program
    attr_reader(
      :pid,
      :tid,
      :name,
      :channel_name
    )

    # (1) :method_name => "NameInSyoboiCalendarResponse"
    # (2) :method_name => ["NameInSyoboiCalendarResponse", callback]
    EXT_PARAM_MAP = {
      :channel_epg_url => "ChEPGURL",
      :channel_id      => "ChID",
      :comment         => "Comment",
      :config_flag     => "ConfFlag",
      :count           => "Count",
      :end_time        => ["EdTime", proc { |val| Time.at(val.to_i) }],
      :start_time      => ["StTime", proc { |val| Time.at(val.to_i) }],
      :subtitle        => "SubTitle",
      :subtitle2       => "SubTitle2"
    }

    # Example:
    #   program.count
    #   program.start_time
    #   ...
    EXT_PARAM_MAP.keys.each do |key|
      define_method(key) do
        update_detail unless @blob.has_key?(key)
        @blob[key]
      end
    end

    # NOTICE: @blob is empty hash at first
    # For example,
    #   If self.start_time is called,
    #   then update_detail is called automatically,
    #   and @blob is updated to fill up @blob[:start_time]
    def initialize(args)
      @pid          = args[:pid]
      @tid          = args[:tid]
      @name         = args[:name]
      @channel_name = args[:channel_name]
      @blob         = {}
    end

    # SAISOKU means "the most earliest broadcasting in the World"
    def saisoku?
      title.first_channel.match(channel_name)
    end

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

    def title
      @title ||= Title.new(:tid => @tid)
    end

    private

    # request detail data
    def get_detail
      hash = self.class.agent.json(
        :Req => "ProgramByPID",
        :PID => @pid,
        :TID => @tid
      )
      hash = hash[hash.keys.first]
      hash = hash[hash.keys.first]
      hash
    end

    def self.agent
      @agent ||= Agent.new
    end
  end
end
