module SyoboiCalendar
  module Resources
    class ChannelResource < BaseResource
      # @return [Integer, nil]
      def channel_group_id
        response.ChGID.try(:to_i)
      end

      # @return [String, nil]
      def comment
        response.ChComment
      end

      # @return [String, nil]
      def epg_url
        response.ChEPGURL
      end

      # @return [Integer, nil]
      def id
        response.ChID.try(:to_i)
      end

      # @return [String, nil]
      def iepg_name
        response.ChiEPGName
      end

      # @return [String, nil]
      def name
        response.ChName
      end

      # @return [Integer, nil]
      def number
        response.ChNumber.try(:to_i)
      end

      # @return [String, nil]
      def url
        response.ChURL
      end
    end
  end
end
