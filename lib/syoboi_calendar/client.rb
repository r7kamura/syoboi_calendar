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

    def login
      return if @is_login
      page = @agent.get(LOGIN_URL)
      form = page.forms[1]
      form.usr  = @user
      form.pass = @pass
      @agent.submit(form)
      @is_login = true
    end

    def search
      url = create_search_url
      @agent.get(url)
    end

    private

    def create_search_url
      SEARCH_URL + "?" + {
        :sd  => 2, # program
        :uud => 1, # user setting
        :v   => 0, # list
        :r   => 0, # all range
      }.map { |k, v| "#{k}=#{v}" }.join("&")
    end
  end
end
