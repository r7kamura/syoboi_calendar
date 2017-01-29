module SyoboiCalendar
  class Client
    # @return [Array<SyoboiCalendar::Resources::Channel>]
    def list_channels(options = {})
      Processors::Channel.process(options)
    end

    # @return [Array<SyoboiCalendar::Resources::Program>]
    def list_programs(options = {})
      Processors::Program.process(options)
    end

    # @return [Array<SyoboiCalendar::Resources::Title>]
    def list_titles(options = {})
      Processors::Title.process(options)
    end
  end
end
