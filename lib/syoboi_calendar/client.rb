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

    # @return [Array<SyoboiCalendar::Resources::ChannelGroup>]
    def list_channel_groups(options = {})
      query = ::SyoboiCalendar::Queries::ChannelGroupQuery.new(options)
      faraday_response = get(query.to_hash)
      ::SyoboiCalendar::Responses::ChannelGroupsResponse.new(faraday_response)
    end

    # @return [Array<SyoboiCalendar::Resources::Channel>]
    def list_channels(options = {})
      query = ::SyoboiCalendar::Queries::ChannelQuery.new(options)
      faraday_response = get(query.to_hash)
      ::SyoboiCalendar::Responses::ChannelsResponse.new(faraday_response)
    end

    # @return [Array<SyoboiCalendar::Resources::Program>]
    def list_programs(options = {})
      query = ::SyoboiCalendar::Queries::ProgramQuery.new(options)
      faraday_response = get(query.to_hash)
      ::SyoboiCalendar::Responses::ProgramsResponse.new(faraday_response)
    end

    # @return [Array<SyoboiCalendar::Resources::Title>]
    def list_titles(options = {})
      query = ::SyoboiCalendar::Queries::TitleQuery.new(options)
      faraday_response = get(query.to_hash)
      ::SyoboiCalendar::Responses::TitlesResponse.new(faraday_response)
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
