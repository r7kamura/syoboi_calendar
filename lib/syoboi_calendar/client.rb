module SyoboiCalendar
  class Client
    ENDPOINT_BASE_URL = "http://cal.syoboi.jp"
    ENDPOINT_PATH = "/db.php"

    # @return [Faraday::Connection]
    def connection
      @connection ||= ::Faraday::Connection.new(url: ENDPOINT_BASE_URL) do |connection|
        connection.adapter :net_http
        connection.response :raise_error
      end
    end

    # @param options [Hash]
    # @return [SyoboiCalendar::Response]
    def list_channel_groups(options = {})
      query = ::SyoboiCalendar::Queries::ChannelGroupQuery.new(options)
      faraday_response = get(query.to_hash)
      ::SyoboiCalendar::Response.new(
        faraday_response: faraday_response,
        response_parser_class: ::SyoboiCalendar::ResponseParsers::ChannelGroupsResponseParser,
      )
    end

    # @param options [Hash]
    # @return [SyoboiCalendar::Response]
    def list_channels(options = {})
      query = ::SyoboiCalendar::Queries::ChannelQuery.new(options)
      faraday_response = get(query.to_hash)
      ::SyoboiCalendar::Response.new(
        faraday_response: faraday_response,
        response_parser_class: ::SyoboiCalendar::ResponseParsers::ChannelsResponseParser,
      )
    end

    # @param options [Hash]
    # @return [SyoboiCalendar::Response]
    def list_programs(options = {})
      query = ::SyoboiCalendar::Queries::ProgramQuery.new(options)
      faraday_response = get(query.to_hash)
      ::SyoboiCalendar::Response.new(
        faraday_response: faraday_response,
        response_parser_class: ::SyoboiCalendar::ResponseParsers::ProgramsResponseParser,
      )
    end

    # @param options [Hash]
    # @return [SyoboiCalendar::Response]
    def list_titles(options = {})
      query = ::SyoboiCalendar::Queries::TitleQuery.new(options)
      faraday_response = get(query.to_hash)
      ::SyoboiCalendar::Response.new(
        faraday_response: faraday_response,
        response_parser_class: ::SyoboiCalendar::ResponseParsers::TitlesResponseParser,
      )
    end

    private

    # @private
    # @param query [Hash]
    # @return [Faraday::Response]
    def get(query)
      connection.get(ENDPOINT_PATH, query)
    end
  end
end
