module SyoboiCalendar
  class Client
    def channels(options = {})
      Processors::Channel.process(options)
    end

    def programs(options = {})
      Processors::Program.process(options)
    end

    def titles(options = {})
      Processors::Title.process(options)
    end
  end
end
