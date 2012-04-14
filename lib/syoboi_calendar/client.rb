class SyoboiCalendar
  module Client
    # user and pass are optional to search with user's channel setting
    def initialize(opts = {})
      @agent = Agent.new(:user => opts[:user], :pass => opts[:pass])
    end

    def login?
      @agent.login?
    end

    # search programs
    def search(args)
      query = create_search_query(args)
      page  = @agent.search(query)

      args[:mode] == :title ?
        extract_titles(page) :
        extract_programs(page)
    end

    private

    # return Array of #<SyoboiCalendar::Program> by #<Mechanize::Page>
    def extract_programs(page, opts = {})
      page.search(".tframe tr").map do |tr|
        args = {}

        tr.search("td:nth-child(2) a").each do |a|
          if match = a.attributes["href"].value.match(%r|/tid/(\d+)/time#(\d+)$|)
            args[:tid]  = match[1]
            args[:pid]  = match[2]
            args[:name] = a.text
          end
        end

        tr.search("td:nth-child(3)").each do |td|
          args[:channel_name] = td.text
        end

        if args.has_key?(:tid)
          Program.new(args)
        else
          nil
        end
      end.compact
    end

    # return Array of #<SyoboiCalendar::Title> by #<Mechanize::Page>
    def extract_titles(page, opts = {})
      page.search(".tframe tr").map do |tr|
        args = {}

        tr.search("td:nth-child(1) a").each do |a|
          if match = a.attributes["href"].value.match(%r|/tid/(\d+)$|)
            args[:tid]  = match[1]
            args[:name] = a.text
          end
        end

        if args.has_key?(:tid)
          Title.new(args)
        else
          nil
        end
      end.compact
    end

    # create hash for search query
    def create_search_query(opts)
      {
        :sd  => { nil => 2, :program => 2, :title => 0 }[opts[:mode]],
        :r   => { nil => 0, :all => 0, :past => 1, :future => 2}[opts[:range]] || 3,
        :rd  => opts[:range],
        :kw  => opts[:keyword],
        :ch  => opts[:channel],
        :st  => opts[:subtitle],
        :cm  => opts[:comment],
        :uuc => opts[:uuc] || 1,     # use user's channel setting
        :v   => opts[:v] || 0,       # list view
        :pfn => opts[:first] && 2,   # first episode
        :pfl => opts[:final] && 4,   # final episode
        :pfs => opts[:special] && 1, # special program
      }.select { |k, v| v }
    end
  end
end
