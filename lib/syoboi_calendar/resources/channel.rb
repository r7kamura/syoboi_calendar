module SyoboiCalendar
  module Resources
    class Channel < Base
      def comment
        response.ChComment
      end

      def epg_url
        response.ChEPGURL
      end

      def group_id
        response.ChGID.try(:to_i)
      end

      def id
        response.ChID.try(:to_i)
      end

      def name
        response.ChName
      end

      def number
        response.ChNumber.try(:to_i)
      end

      def url
        response.ChURL
      end

      def iepg_name
        response.ChiEPGName
      end
    end
  end
end
