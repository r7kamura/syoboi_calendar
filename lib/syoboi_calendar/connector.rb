module SyoboiCalendar
  class Connector
    URL = "http://cal.syoboi.jp/"
    PATH = "/db.php"

    def get(params)
      connection.get(path, params)
    end

    def connection
      @connection ||= Faraday.new(url: url) do |connection|
        connection.adapter :net_http
        connection.response :mashify
        connection.response :xml
        connection.response :raise_error
      end
    end

    def path
      PATH
    end

    def url
      URL
    end
  end
end
