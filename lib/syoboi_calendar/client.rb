require "faraday"
require "faraday_middleware"

module SyoboiCalendar
  class Client
    ENDPOINT_BASE_URL = "http://cal.syoboi.jp"
    ENDPOINT_PATH = "/db.php"

    # @return [Faraday::Connection]
    def connection
      @connection ||= ::Faraday::Connection.new(url: ENDPOINT_BASE_URL) do |connection|
        connection.adapter :net_http
        connection.response :xml
        connection.response :raise_error
      end
    end

    # @param options [Hash]
    # @return [SyoboiCalendar::Response]
    def list_channel_groups(options = {})
      list(
        options: options,
        query_class: ::SyoboiCalendar::Queries::ChannelGroupQuery,
        response_class: ::SyoboiCalendar::Responses::ChannelGroupsResponse,
      )
    end

    # @param options [Hash]
    # @return [SyoboiCalendar::Response]
    def list_channels(options = {})
      list(
        options: options,
        query_class: ::SyoboiCalendar::Queries::ChannelQuery,
        response_class: ::SyoboiCalendar::Responses::ChannelsResponse,
      )
    end

    # @param options [Hash]
    # @return [SyoboiCalendar::Response]
    def list_programs(options = {})
      list(
        options: options,
        query_class: ::SyoboiCalendar::Queries::ProgramQuery,
        response_class: ::SyoboiCalendar::Responses::ProgramsResponse,
      )
    end

    # @param options [Hash]
    # @return [SyoboiCalendar::Response]
    def list_titles(options = {})
      list(
        options: options,
        query_class: ::SyoboiCalendar::Queries::TitleQuery,
        response_class: ::SyoboiCalendar::Responses::TitlesResponse,
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
    # @param response_class [Class]
    # @return [SyoboiCalendar::Responses::BaseResponse]
    def list(options:, query_class:, response_class:)
      query = query_class.new(options)
      faraday_response = get(query.to_hash)
      response_class.new(faraday_response)
    end
  end
end
