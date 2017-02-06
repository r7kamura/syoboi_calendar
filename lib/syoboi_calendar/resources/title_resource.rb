module SyoboiCalendar
  module Resources
    class TitleResource < BaseResource
      property :category_id
      property :comment
      property :english_name
      property :first_channel
      property :first_end_month
      property :first_end_year
      property :first_month
      property :first_year
      property :flag
      property :id
      property :kana
      property :name
      property :point
      property :rank
      property :short_title
      property :sub_titles

      # @note
      #    0: その他
      #    1: アニメ
      #    2: ラジオ
      #    3: テレビ
      #    4: 特撮
      #    5: アニメ関連
      #    6: メモ
      #    7: OVA
      #    8: 映画
      #   10: アニメ(終了/再放送)
      # @return [Integer, nil]
      def category_id
        if source["Cat"]
          source["Cat"].to_i
        end
      end

      # @return [String, nil]
      def comment
        source["Comment"]
      end

      # @return [String, nil]
      def english_name
        source["TitleEN"]
      end

      # @return [String, nil]
      def first_channel
        source["FirstCh"]
      end

      # @return [Integer, nil]
      def first_end_month
        if source["FirstEndMonth"]
          source["FirstEndMonth"].to_i
        end
      end

      # @return [Integer, nil]
      def first_end_year
        if source["FirstEndYear"]
          source["FirstEndYear"].to_i
        end
      end

      # @return [Integer, nil]
      def first_month
        if source["FirstMonth"]
          source["FirstMonth"].to_i
        end
      end

      # @return [Integer, nil]
      def first_year
        if source["FirstYear"]
          source["FirstYear"].to_i
        end
      end

      # @return [Integer, nil]
      def flag
        if source["TitleFlag"]
          source["TitleFlag"].to_i
        end
      end

      # @return [Integer, nil]
      def id
        if source["TID"]
          source["TID"].to_i
        end
      end

      # @return [String, nil]
      def kana
        source["TitleYomi"]
      end

      # @return [String, nil]
      def keywords
        source["Keywords"]
      end

      # @return [String, nil]
      def name
        source["Title"]
      end

      # @return [Integer, nil]
      def point
        if source["UserPoint"]
          source["UserPoint"].to_i
        end
      end

      # @return [Integer, nil]
      def rank
        if source["UserPointRank"]
          source["UserPointRank"].to_i
        end
      end

      # @return [String, nil]
      def short_title
        source["ShortTitle"]
      end

      # @return [String, nil]
      def sub_titles
        source["SubTitles"]
      end
    end
  end
end
