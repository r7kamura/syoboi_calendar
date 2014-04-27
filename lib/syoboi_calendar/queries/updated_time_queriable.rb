module SyoboiCalendar
  module Queries
    module UpdatedTimeQueriable
      extend ActiveSupport::Concern

      included do
        option(
          :updated_from,
          :updated_to,
        )

        property(
          :LastUpdate,
        )
      end

      private

      def last_update
        "#{updated_from}-#{updated_to}" if has_updated_time?
      end

      def has_updated_time?
        !!(updated_from || updated_to)
      end
    end
  end
end
