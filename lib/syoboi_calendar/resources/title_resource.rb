module SyoboiCalendar
  module Resources
    class TitleResource < BaseResource
      # @return [Integer, nil]
      def category_id
        response.Cat.try(:to_i)
      end

      # @return [String, nil]
      def comment
        response.Comment
      end

      # @return [String, nil]
      def english_name
        response.TitleEN
      end

      # @return [String, nil]
      def first_channel
        response.FirstCh
      end

      # @return [Integer, nil]
      def first_end_month
        response.FirstEndMonth.try(:to_i)
      end

      # @return [Integer, nil]
      def first_end_year
        response.FirstEndYear.try(:to_i)
      end

      # @return [Integer, nil]
      def first_month
        response.FirstMonth.try(:to_i)
      end

      # @return [Integer, nil]
      def first_year
        response.FirstYear.try(:to_i)
      end

      # @return [Integer, nil]
      def id
        response.TID.try(:to_i)
      end

      # @return [String, nil]
      def name
        response.Title
      end

      # @return [Integer, nil]
      def flag
        response.TitleFlag.try(:to_i)
      end

      # @return [String, nil]
      def kana
        response.TitleYomi
      end

      # @return [String, nil]
      def keywords
        response.Keywords
      end

      # @return [String, nil]
      def short_title
        response.ShortTitle
      end

      # @return [String, nil]
      def sub_titles
        response.SubTitles
      end

      # @return [Integer, nil]
      def point
        response.UserPoint.try(:to_i)
      end

      # @return [Integer, nil]
      def rank
        response.UserPointRank.try(:to_i)
      end
    end
  end
end
