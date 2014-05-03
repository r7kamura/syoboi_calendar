module SyoboiCalendar
  module Processors
    class Program < Base
      def process
        include_channel if specified_to_include_channel?
        include_title if specified_to_include_title?
        resources
      end

      private

      def query_builder
        QueryBuilders::Program
      end

      def parser
        Parsers::Program
      end

      def titles_indexed_by_id
        @titles_indexed_by_id ||= titles.index_by(&:id)
      end

      def titles
        Parsers::Title.parse(titles_response)
      end

      def titles_response
        connector.get(titles_query).body
      end

      def titles_query
        QueryBuilders::Title.build(title_id: title_ids.join(","))
      end

      def title_ids
        resources.map(&:title_id)
      end

      def specified_to_include_title?
        includes.include?(:title)
      end

      def specified_to_include_channel?
        includes.include?(:channel)
      end

      def include_title
        resources.each do |program|
          program.title = titles_indexed_by_id[program.title_id]
        end
      end

      def channels_indexed_by_id
        @channels_indexed_by_id ||= channels.index_by(&:id)
      end

      def channels
        Parsers::Channel.parse(channels_response)
      end

      def channels_response
        connector.get(channels_query).body
      end

      def channels_query
        QueryBuilders::Channel.build(channel_id: channel_ids.join(","))
      end

      def channel_ids
        resources.map(&:channel_id)
      end

      def include_channel
        resources.each do |program|
          program.channel = channels_indexed_by_id[program.channel_id]
        end
      end
    end
  end
end
