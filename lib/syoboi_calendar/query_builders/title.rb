module SyoboiCalendar
  module QueryBuilders
    class Title < Base
      option :title_id

      property :TID

      alias tid title_id

      private

      def command
        "TitleLookup"
      end
    end
  end
end
