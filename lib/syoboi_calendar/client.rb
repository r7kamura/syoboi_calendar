module SyoboiCalendar
  class Client
    # initialize client and login if possible
    def initialize(args)
      @is_login = false
      @user = args[:user]
      @pass = args[:pass]
      login
    end

    # login to SyoboiCalendar
    def login
      return if @is_login || !@user || !@pass
      Agent.login(:user => @user, :pass => @pass)
      @is_login = true
    end

    # search programs
    def search(opts)
      query = create_search_query(opts)
      page  = Agent.search(query)
      extract_programs(page)
    end

    private

    # return Array of #<SyoboiCalendar::Program> by #<Mechanize::Page>
    def extract_programs(page)
      programs = []
      page.search(".tframe tr").each do |tr|
        args = {}

        tr.search("td:nth-child(2) a").each do |a|
          if match = a.attributes["href"].value.match(%r|/tid/(\d+)/time#(\d+)$|)
            args[:tid]   = match[1]
            args[:pid]   = match[2]
            args[:title] = a.text
          end
        end

        tr.search("td:nth-child(3)").each do |td|
          args[:channel_name] = td.text
        end

        programs << Program.new(args) if args[:tid] && args[:pid]
      end
      programs
    end

    # create hash for search query
    def create_search_query(opts)
      {
        :sd  => { nil => 2, :program => 2, :title => 0 }[opts[:mode]],
        :r   => { nil => 0, :all => 0, :past => 1, :future => 2}[opts[:range]] || 3,
        :rd  => opts[:range],
        :kw  => opts[:title],
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
