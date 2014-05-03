module SyoboiCalendar
  class Client
    def channels(options = {})
      get QueryBuilders::Channel.build(options)
    end

    def programs(options = {})
      get QueryBuilders::Program.build(options)
    end

    def titles(options = {})
      get QueryBuilders::Title.build(options)
    end

    private

    def connector
      @connector ||= Connector.new
    end

    def get(query)
      connector.get(query).body
    end
  end
end
