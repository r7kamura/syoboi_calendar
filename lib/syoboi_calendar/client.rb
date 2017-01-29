module SyoboiCalendar
  class Client
    ENDPOINT_BASE_URL = "http://cal.syoboi.jp"
    ENDPOINT_PATH = "/db.php"

    # @return [Faraday::Connection]
    def connection
      @connection ||= ::Faraday::Connection.new(url: ENDPOINT_BASE_URL) do |connection|
        connection.adapter :net_http
        connection.response :mashify
        connection.response :xml
        connection.response :raise_error
      end
    end

    # @return [Array<SyoboiCalendar::Resources::Channel>]
    def list_channels(options = {})
      query = ::SyoboiCalendar::QueryBuilders::Channel.build(options)
      response = get(query)
      ::SyoboiCalendar::Parsers::Channel.parse(response.body)
    end

    # @return [Array<SyoboiCalendar::Resources::Program>]
    def list_programs(options = {})
      query = ::SyoboiCalendar::QueryBuilders::Program.build(options)
      response = get(query)
      ::SyoboiCalendar::Parsers::Program.parse(response.body)
    end

    # @return [Array<SyoboiCalendar::Resources::Title>]
    def list_titles(options = {})
      query = ::SyoboiCalendar::QueryBuilders::Title.build(options)
      response = get(query)
      ::SyoboiCalendar::Parsers::Title.parse(response.body)
    end

    private

    # @private
    # @param path [String]
    # @param query [Hash]
    # @return [Faraday::Response]
    def get(query)
      connection.get(ENDPOINT_PATH, query)
    end
  end
end
