module SyoboiCalendar
  module Resources
    class ChannelGroupResource < BaseResource
      property :comment
      property :id
      property :name
      property :order

      # @return [String, nil]
      def comment
        source["ChGroupComment"]
      end

      # @return [Integer, nil]
      def id
        if source["ChGID"]
          source["ChGID"].to_i
        end
      end

      # @return [String, nil]
      def name
        source["ChGroupName"]
      end

      # @return [Integer, nil]
      def order
        if source["ChGroupOrder"]
          source["ChGroupOrder"].to_i
        end
      end
    end
  end
end
