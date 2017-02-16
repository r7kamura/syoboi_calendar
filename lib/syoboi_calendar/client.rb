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
      end
    end

    # @param options [Hash]
    # @return [SyoboiCalendar::Response]
    def list_channel_groups(options = {})
      list(
        options: options,
        query_class: ::SyoboiCalendar::Queries::ListChannelGroupsQuery,
        response_class: ::SyoboiCalendar::Responses::ListChannelGroupsResponse,
      )
    end

    # @param options [Hash]
    # @return [SyoboiCalendar::Response]
    def list_channels(options = {})
      list(
        options: options,
        query_class: ::SyoboiCalendar::Queries::ListChannelsQuery,
        response_class: ::SyoboiCalendar::Responses::ListChannelsResponse,
      )
    end

    # @param options [Hash]
    # @return [SyoboiCalendar::Response]
    def list_programs(options = {})
      list(
        options: options,
        query_class: ::SyoboiCalendar::Queries::ListProgramsQuery,
        response_class: ::SyoboiCalendar::Responses::ListProgramsResponse,
      )
    end

    # @param options [Hash]
    # @return [SyoboiCalendar::Response]
    def list_titles(options = {})
      list(
        options: options,
        query_class: ::SyoboiCalendar::Queries::ListTitlesQuery,
        response_class: ::SyoboiCalendar::Responses::ListTitlesResponse,
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
    # @return [SyoboiCalendar::Responses::ListBaseResponse]
    def list(options:, query_class:, response_class:)
      query = query_class.new(options)
      faraday_response = get(query.to_hash)
      response_class.new(faraday_response)
    end
  end
end
