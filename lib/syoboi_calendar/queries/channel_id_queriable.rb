module SyoboiCalendar
  module Queries
    module ChannelIdQueriable
      extend ActiveSupport::Concern

      included do
        option :channel_id

        property :ChID

        alias ch_id channel_id
      end
    end
  end
end
