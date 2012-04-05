require "uri"
require "json"

module SyoboiCalendar
  class Agent
    BASE_URL   = "http://cal.syoboi.jp"
    SEARCH_URL = BASE_URL + "/find"
    JSON_URL   = BASE_URL + "/json.php"
    LOGIN_URL  = BASE_URL + "/usr"

    # login is option to search with user channel setting
    def initialize(opts = {})
      if opts[:user] && opts[:pass]
        login(opts[:user], opts[:pass])
      end
    end

    def login(user, pass)
      page = get LOGIN_URL
      form = page.forms[1]
      form.usr  = user
      form.pass = pass
      mechanize.submit(form)
      @logined = true
    end

    def login?
      @logined
    end

    def json(query)
      page = get JSON_URL, query
      JSON.parse(page.content)
    end

    def search(query)
      get SEARCH_URL, query
    end

    private

    def get(url, hash = {})
      mechanize.get(url + querinize(hash))
    end

    # change hash into URL query string
    def querinize(hash)
      "?" + hash.map { |k, v| "#{k}=#{URI.encode(v.to_s)}" }.join("&")
    end

    def mechanize
      @mechanize ||= Mechanize.new
    end
  end
end
