module SyoboiCalendar
  module Resources
    class ProgramResource < BaseResource
      # @return [SyoboiCalendar::Resources::Channel, nil]
      attr_accessor :channel

      # @return [SyoboiCalendar::Resources::Title, nil]
      attr_accessor :title

      # @return [Integer, nil]
      def channel_id
        response.ChID.try(:to_i)
      end

      # @return [String, nil]
      def comment
        response.ProgComment
      end

      # @return [Integer, nil]
      def count
        response.Count.try(:to_i)
      end

      # @return [Boolean]
      def deleted?
        response.Deleted != "0"
      end

      # @return [Integer, nil]
      def flag
        response.Flag.try(:to_i)
      end

      # @return [Integer, nil]
      def id
        response.PID.try(:to_i)
      end

      # @return [String, nil]
      def iepg_name
        response.ChiEPGName
      end

      # @return [Time]
      def finished_at
        ::Time.parse(response.EdTime)
      end

      # @return [Integer, nil]
      def revision
        response.Revision.try(:to_i)
      end

      # @return [Time]
      def started_at
        ::Time.parse(response.StTime)
      end

      # @return [String, nil]
      def sub_title
        response.STSubTitle
      end

      # @return [Integer]
      def title_id
        response.TID.try(:to_i)
      end

      # @return [Integer, nil]
      def warn
        response.Warn.try(:to_i)
      end
    end
  end
end
