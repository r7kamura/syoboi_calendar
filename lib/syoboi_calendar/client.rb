require "faraday"

module SyoboiCalendar
  class Client
    HOST = "cal.syoboi.jp"

    attr_reader :options

    def initialize(options = {})
      @options = options
    end

    def channels(options = {})
      get(ChannelsQuery, options)
    end

    def programs(options = {})
      get(ProgramsQuery, options)
    end

    def titles(options = {})
      get(TitlesQuery, options)
    end

    private

    def get(query_class, options = {})
      connection.get(
        "/db.php",
        query_class.new(options).to_hash,
      )
    end

    def connection
      @connection ||= Faraday.new(url: url) do |connection|
        connection.adapter :net_http
      end
    end

    def url
      "http://#{host}/"
    end
  end
end
