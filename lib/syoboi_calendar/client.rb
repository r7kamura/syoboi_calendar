module SyoboiCalendar
  class Client
    BASE_URL   = "http://cal.syoboi.jp"
    JSON_URL   = BASE_URL + "/json.php"
    LOGIN_URL  = BASE_URL + "/usr"
    SEARCH_URL = BASE_URL + "/find"

    def initialize(args)
      @user     = args[:user]
      @pass     = args[:pass]
      @agent    = Mechanize.new
      @is_login = false
    end

    # login to SyoboiCalendar
    def login
      return if @is_login
      page = @agent.get(LOGIN_URL)
      form = page.forms[1]
      form.usr  = @user
      form.pass = @pass
      @agent.submit(form)
      @is_login = true
    end

    # return array of hash
    #   :tid
    #   :pid
    #   :title
    def search(opts)
      url  = create_search_url(opts)
      page = @agent.get(url)
      extract_programs(page)
    end

    private

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

    def create_search_url(opts)
      SEARCH_URL + "?" + {
        :sd  => 2, # program
        :uuc => 1, # user setting
        :v   => 0, # list
        :r   => 0  # all range
      }.merge(opts).map { |k, v| "#{k}=#{v}" }.join("&")
    end
  end
end
