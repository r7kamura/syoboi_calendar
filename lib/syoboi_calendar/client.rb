module SyoboiCalendar
  class Client
    def channels(options = {})
      process(
        QueryBuilders::Channel,
        Parsers::Channel,
        options,
      )
    end

    def programs(options = {})
      process(
        QueryBuilders::Program,
        Parsers::Program,
        options,
      )
    end

    def titles(options = {})
      process(
        QueryBuilders::Title,
        Parsers::Title,
        options,
      )
    end

    private

    def connector
      @connector ||= Connector.new
    end

    def get(query)
      connector.get(query).body
    end

    def process(builder, parser, options)
      query = builder.build(options)
      response = get(query)
      parser.parse(response)
    end
  end
end
