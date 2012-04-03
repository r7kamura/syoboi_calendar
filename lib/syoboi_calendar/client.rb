module SyoboiCalendar
  class Client
    BASE_URL   = "http://cal.syoboi.jp"
    LOGIN_URL  = BASE_URL + "/usr"
    SEARCH_URL = BASE_URL + "/find"

    def initialize(args)
      @is_login = false
      @user = args[:user]
      @pass = args[:pass]
      login
    end

    # login to SyoboiCalendar
    def login
      return if @is_login || !@user || !@pass
      Agent.login(:user => @user, :pass => @pass)
      @is_login = true
    end

    # search programs
    def search(opts)
      query = create_search_query(opts)
      page  = Agent.search(query)
      extract_programs(page)
    end

    private

    # return Array of #<SyoboiCalendar::Program> by #<Mechanize::Page>
    def extract_programs(page)
      page.search(".tframe tr td:nth-child(2) a").map do |a|
        if match = a.attributes["href"].value.match(%r|/tid/(\d+)/time#(\d+)$|)
          Program.new(
            :tid   => match[1],
            :pid   => match[2],
            :title => a.text
          )
        else
          nil
        end
      end.compact
    end

    # Adjust opts and create URL to search programs or titles
    #   sd:  program(2) or title(0)
    #   uuc: narrow the search to login user's channel setting
    #   v:   return list(0)
    #   r:   range type(0..3)
    #   rd:  range(str)
    def create_search_query(opts)
      hash = {}

      case opts[:mode]
      when :title then hash[:sd] = 0
      else             hash[:sd] = 2
      end

      case opts[:range]
      when :all, nil then hash[:r] = 0
      when :past     then hash[:r] = 1
      when :future   then hash[:r] = 2
      else                hash[:r] = 3
        hash[:rd] = opts[:range]
      end

      hash[:pfn] = 2 if opts[:first]   # first episode
      hash[:pfl] = 4 if opts[:final]   # final episode
      hash[:pfn] = 1 if opts[:special] # special program

      {
        :title    => :kw,
        :channel  => :ch,
        :subtitle => :st,
        :comment  => :cm,
      }.each { |k, v| hash[v] = opts[k] if opts[k] }

      {
        :uuc => 1,
        :v   => 0,
      }.merge(hash)
    end
  end
end
