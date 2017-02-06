module SyoboiCalendar
  module Resources
    class ChannelGroupResource < BaseResource
      # @return [String, nil]
      def comment
        response.ChGroupComment
      end

      # @return [Integer, nil]
      def id
        response.ChGID.try(:to_i)
      end

      # @return [String, nil]
      def name
        response.ChGroupName
      end

      # @return [Integer, nil]
      def order_score
        response.ChGroupOrder.try(:to_i)
      end
    end
  end
end
