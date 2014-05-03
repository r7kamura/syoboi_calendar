module SyoboiCalendar
  class Client
    def channels(options = {})
      get Queries::Channel.build(options)
    end

    def programs(options = {})
      get Queries::Program.build(options)
    end

    def titles(options = {})
      get Queries::Title.build(options)
    end

    private

    def get(params)
      connection.get(path, params).body
    end

    def connection
      @connection ||= Faraday.new(url: url) do |connection|
        connection.adapter :net_http
        connection.response :mashify
        connection.response :xml
        connection.response :raise_error
      end
    end

    def url
      "http://#{host}/"
    end

    def host
      "cal.syoboi.jp"
    end

    def path
      "/db.php"
    end
  end
end
