module SyoboiCalendar
  module Queries
    class Title < Base
      include UpdatedTimeQueriable

      option :tid

      property :TID

      private

      def command
        "TitleLookup"
      end
    end
  end
end
