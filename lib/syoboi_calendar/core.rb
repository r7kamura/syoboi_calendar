module SyoboiCalendar

  # This module will be extended by SyoboiCalendar module
  module Core
    def agent
      @agent ||= Mechanize.new
    end
  end
end
