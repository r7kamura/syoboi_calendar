require "faraday"

module SyoboiCalendar
  class Client
    HOST = "cal.syoboi.jp"

    attr_reader :options

    def initialize(options = {})
      @options = options
    end

    def channels(options = {})
      get(Queries::Channel, options)
    end

    def programs(options = {})
      get(Queries::Program, options)
    end

    def titles(options = {})
      get(Queries::Title, options)
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
