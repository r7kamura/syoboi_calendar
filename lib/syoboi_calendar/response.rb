module SyoboiCalendar
  class Response
    include ::Enumerable

    # @param faraday_response [Faraday::Response]
    # @param response_parser_class [Class]
    def initialize(faraday_response:, response_parser_class:)
      @faraday_response = faraday_response
      @response_parser_class = response_parser_class
    end

    # @return [String]
    def body
      faraday_response.body
    end

    # @note Implementation for Enumerable
    def each(&block)
      resources.each(&block)
    end

    # @return [Faraday::Utils::Headers]
    def headers
      faraday_response.headers
    end

    # @return [Array<SyoboiCalendar::Resources::BaseResource>]
    def resources
      @resources ||= response_parser_class.new(body).parse
    end

    # @return [Integer]
    def status
      faraday_response.status
    end

    private

    # @return [Faraday::Response]
    def faraday_response
      @faraday_response
    end

    # @return [Class]
    def response_parser_class
      @response_parser_class
    end
  end
end
