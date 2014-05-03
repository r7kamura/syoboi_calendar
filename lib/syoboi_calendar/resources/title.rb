module SyoboiCalendar
  module Resources
    class Title < Base
      def category_id
        response.Cat.try(:to_i)
      end

      def comment
        response.Comment
      end

      def first_channel
        response.FirstCh
      end

      def first_end_month
        response.FirstEndMonth.try(:to_i)
      end

      def first_end_year
        response.FirstEndYear.try(:to_i)
      end

      def first_month
        response.FirstMonth.try(:to_i)
      end

      def first_year
        response.FirstYear.try(:to_i)
      end

      def keywords
        response.Keywords
      end

      def short_title
        response.ShortTitle
      end

      def sub_titles
        response.SubTitles
      end

      def id
        response.TID.try(:to_i)
      end

      def name
        response.Title
      end

      def english_name
        response.TitleEN
      end

      def flag
        response.TitleFlag.try(:to_i)
      end

      def kana
        response.TitleYomi
      end

      def point
        response.UserPoint.try(:to_i)
      end

      def rank
        response.UserPointRank.try(:to_i)
      end
    end
  end
end
