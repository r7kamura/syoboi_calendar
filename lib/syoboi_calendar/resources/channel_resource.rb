module SyoboiCalendar
  module Resources
    class ChannelResource < BaseResource
      # @return [Integer, nil]
      def channel_group_id
        if source["ChGID"]
          source["ChGID"].to_i
        end
      end

      # @return [String, nil]
      def comment
        source["ChComment"]
      end

      # @return [String, nil]
      def epg_url
        source["ChEPGURL"]
      end

      # @return [Integer, nil]
      def id
        if source["ChID"]
          source["ChID"].to_i
        end
      end

      # @return [String, nil]
      def iepg_name
        source["ChiEPGName"]
      end

      # @return [String, nil]
      def name
        source["ChName"]
      end

      # @return [Integer, nil]
      def number
        if source["ChNumber"]
          source["ChNumber"].to_i
        end
      end

      # @return [String, nil]
      def url
        source["ChURL"]
      end
    end
  end
end
