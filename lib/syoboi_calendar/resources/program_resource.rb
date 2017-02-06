module SyoboiCalendar
  module Resources
    class ProgramResource < BaseResource
      property :channel_id
      property :comment
      property :count
      property :deleted
      property :finished_at
      property :flag
      property :id
      property :iepg_name
      property :revision
      property :started_at
      property :sub_title
      property :title_id
      property :warn

      # @return [Integer, nil]
      def channel_id
        if source["ChID"]
          source["ChID"].to_i
        end
      end

      # @return [String, nil]
      def comment
        source["ProgComment"]
      end

      # @return [Integer, nil]
      def count
        if source["Count"]
          source["Count"].to_i
        end
      end

      # @return [Boolean]
      def deleted?
        source["Deleted"] != "0"
      end
      alias_method :deleted, :deleted?

      # @return [Time, nil]
      def finished_at
        if source["EdTime"]
          ::Time.parse(source["EdTime"])
        end
      end

      # @return [Integer, nil]
      def flag
        if source["Flag"]
          source["Flag"].to_i
        end
      end

      # @return [Integer, nil]
      def id
        if source["PID"]
          source["PID"].to_i
        end
      end

      # @return [String, nil]
      def iepg_name
        source["ChiEPGName"]
      end

      # @return [Integer, nil]
      def revision
        if source["Revision"]
          source["Revision"].to_i
        end
      end

      # @return [Time, nil]
      def started_at
        if source["StTime"]
          ::Time.parse(source["StTime"])
        end
      end

      # @return [String, nil]
      def sub_title
        source["STSubTitle"]
      end

      # @return [Integer]
      def title_id
        if source["TID"]
          source["TID"].to_i
        end
      end

      # @return [Integer, nil]
      def warn
        if source["Warn"]
          source["Warn"].to_i
        end
      end
    end
  end
end
