module SyoboiCalendar
  module Resources
    class Program < Base
      def id
        response.PID.try(:to_i)
      end

      def title_id
        response.TID.try(:to_i)
      end

      def started_at
        Time.parse(response.StTime)
      end

      def finished_at
        Time.parse(response.EdTime)
      end

      def count
        response.Count.try(:to_i)
      end

      def sub_title
        response.STSubTitle
      end

      def comment
        response.ProgComment
      end

      def flag
        response.Flag.try(:to_i)
      end

      def deleted?
        response.Deleted != "0"
      end

      def warn
        response.Warn.try(:to_i)
      end

      def channel_id
        response.ChID.try(:to_i)
      end

      def revision
        response.Revision.try(:to_i)
      end
    end
  end
end
