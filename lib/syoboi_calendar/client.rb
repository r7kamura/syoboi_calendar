require "faraday"

module SyoboiCalendar
  class Client
    attr_reader :options

    def initialize(options = {})
      @options = options
    end

    # TODO
    def channels
    end

    # TODO
    def programs
    end

    # TODO
    def titles
    end

    private

    def connection
      @connection ||= Faraday.new do |connection|
        connection.adapter :net_http
      end
    end
  end
end
