require "time"

module SyoboiCalendar
  module Resources
    class ProgramResource < BaseResource
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

      # @return [Boolean]
      def rerun?
        !flag.nil? && flag & 0b1000 != 0
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
