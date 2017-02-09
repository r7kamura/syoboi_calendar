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
      list(
        options: options,
        query_class: ::SyoboiCalendar::Queries::ChannelGroupQuery,
        response_parser_class: ::SyoboiCalendar::ResponseParsers::ChannelGroupsResponseParser,
      )
    end

    # @param options [Hash]
    # @return [SyoboiCalendar::Response]
    def list_channels(options = {})
      list(
        options: options,
        query_class: ::SyoboiCalendar::Queries::ChannelQuery,
        response_parser_class: ::SyoboiCalendar::ResponseParsers::ChannelsResponseParser,
      )
    end

    # @param options [Hash]
    # @return [SyoboiCalendar::Response]
    def list_programs(options = {})
      list(
        options: options,
        query_class: ::SyoboiCalendar::Queries::ProgramQuery,
        response_parser_class: ::SyoboiCalendar::ResponseParsers::ProgramsResponseParser,
      )
    end

    # @param options [Hash]
    # @return [SyoboiCalendar::Response]
    def list_titles(options = {})
      list(
        options: options,
        query_class: ::SyoboiCalendar::Queries::TitleQuery,
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

    # @private
    # @param options [Hash]
    # @param query_class [Class]
    # @param response_parser_class [Class]
    # @return [SyoboiCalendar::Response]
    def list(options:, query_class:, response_parser_class:)
      query = query_class.new(options)
      faraday_response = get(query.to_hash)
      ::SyoboiCalendar::Response.new(
        faraday_response: faraday_response,
        response_parser_class: response_parser_class,
      )
    end
  end
end
