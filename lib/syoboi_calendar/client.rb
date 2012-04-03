module SyoboiCalendar
  class Client
    BASE_URL   = "http://cal.syoboi.jp"
    LOGIN_URL  = BASE_URL + "/usr"
    SEARCH_URL = BASE_URL + "/find"

    def initialize(args)
      @agent    = Mechanize.new
      @is_login = false
      @user = args[:user]
      @pass = args[:pass]
      login
    end

    # login to SyoboiCalendar
    def login
      return if @is_login || !@user || !@pass
      page = @agent.get(LOGIN_URL)
      form = page.forms[1]
      form.usr  = @user
      form.pass = @pass
      @agent.submit(form)
      @is_login = true
    end

    # search programs
    def search(opts)
      url  = create_search_url(opts)
      page = @agent.get(url)
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
    def create_search_url(opts)
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

      SEARCH_URL + "?" + {
        :uuc => 1,
        :v   => 0,
      }.merge(hash).map { |k, v| "#{k}=#{v}" }.join("&")
    end
  end
end
