module SyoboiCalendar
  class Client
    def channels(options = {})
      get Queries::Channel.build(options)
    end

    def programs(options = {})
      get Queries::Program.build(options)
    end

    def titles(options = {})
      get Queries::Title.build(options)
    end

    private

    def connector
      @connector ||= Connector.new
    end

    def get(params)
      connector.get(params).body
    end
  end
end
