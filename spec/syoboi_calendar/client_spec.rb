describe ::SyoboiCalendar::Client do
  let(:client) do
    described_class.new
  end

  describe "#list_channel_groups" do
    subject do
      client.list_channel_groups(options)
    end

    let(:dummy_channel_groups_response) do
      <<-EOS.strip_heredoc
        <?xml version="1.0" encoding="UTF-8"?>
        <ChGroupLookupResponse>
          <Result>
            <Code>200</Code>
            <Message>
            </Message>
          </Result>
          <ChGroupItems>
            <ChGroupItem id="3">
              <ChGroupComment>DummyComment</ChGroupComment>
              <ChGID>1</ChGID>
              <ChGroupName>DummyChannelName</ChGroupName>
              <Order>1000</Order>
              <LastUpdate>2000-01-01 00:00:00</LastUpdate>
            </ChGroupItem>
          </ChGroupItems>
        </ChGroupLookupResponse>
      EOS
    end

    let(:options) do
      {}
    end

    [
      {
        options: {},
        query: {
          Command: "ChGroupLookup",
        },
      },
      {
        options: {
          channel_group_id: 1,
        },
        query: {
          Command: "ChGroupLookup",
          ChGID: 1,
        },
      },
      {
        options: {
          updated_from: ::Time.new(2000, 1, 1),
        },
        query: {
          Command: "ChGroupLookup",
          LastUpdate: "20000101_000000-",
        },
      },
      {
        options: {
          updated_to: ::Time.new(2000, 1, 1),
        },
        query: {
          Command: "ChGroupLookup",
          LastUpdate: "-20000101_000000",
        },
      },
      {
        options: {
          updated_from: ::Time.new(2000, 1, 1),
          updated_to: ::Time.new(2000, 1, 1),
        },
        query: {
          Command: "ChGroupLookup",
          LastUpdate: "20000101_000000-20000101_000000",
        },
      },
    ].each do |example|
      context "with options #{example[:options].inspect}" do
        let(:options) do
          example[:options]
        end

        it "sends an HTTP request to http://cal.syoboi.jp/db.php?#{example[:query].to_query}" do
          stub = stub_request(:get, "http://cal.syoboi.jp/db.php?#{example[:query].to_query}").to_return(body: dummy_channel_groups_response)
          subject
          expect(stub).to have_been_made
        end
      end
    end
  end

  describe "#list_channels" do
    subject do
      client.list_channels(options)
    end

    let(:dummy_channels_response) do
      <<-EOS.strip_heredoc
        <?xml version="1.0" encoding="UTF-8"?>
        <ChLookupResponse>
          <Result>
            <Code>200</Code>
            <Message>
            </Message>
          </Result>
          <ChItems>
            <ChItem id="3">
              <ChComment>DummyComment</ChComment>
              <ChEPGURL>http://example.com/epg-url</ChEPGURL>
              <ChGID>1</ChGID>
              <ChID>3</ChID>
              <ChName>DummyChannelName</ChName>
              <ChNumber>3</ChNumber>
              <ChURL>http://example.com/</ChURL>
              <ChiEPGName>DummyiEPGName</ChiEPGName>
              <LastUpdate>2000-01-01 00:00:00</LastUpdate>
            </ChItem>
          </ChItems>
        </ChLookupResponse>
      EOS
  end

    let(:options) do
      {}
    end

    [
      {
        options: {},
        query: {
          Command: "ChLookup",
        },
      },
      {
        options: {
          channel_id: 1,
        },
        query: {
          Command: "ChLookup",
          ChID: 1,
        },
      },
      {
        options: {
          updated_from: ::Time.new(2000, 1, 1),
        },
        query: {
          Command: "ChLookup",
          LastUpdate: "20000101_000000-",
        },
      },
      {
        options: {
          updated_to: ::Time.new(2000, 1, 1),
        },
        query: {
          Command: "ChLookup",
          LastUpdate: "-20000101_000000",
        },
      },
      {
        options: {
          updated_from: ::Time.new(2000, 1, 1),
          updated_to: ::Time.new(2000, 1, 1),
        },
        query: {
          Command: "ChLookup",
          LastUpdate: "20000101_000000-20000101_000000",
        },
      },
    ].each do |example|
      context "with options #{example[:options].inspect}" do
        let(:options) do
          example[:options]
        end

        it "sends an HTTP request to http://cal.syoboi.jp/db.php?#{example[:query].to_query}" do
          stub = stub_request(:get, "http://cal.syoboi.jp/db.php?#{example[:query].to_query}").to_return(body: dummy_channels_response)
          subject
          expect(stub).to have_been_made
        end
      end
    end

    context "with real response" do
      before do
        stub_request(:get, //).to_return(body: dummy_channels_response)
      end

      it "returns channels" do
        channels = subject
        expect(channels.first.channel_group_id).to eq(1)
        expect(channels.first.comment).to eq("DummyComment")
        expect(channels.first.epg_url).to eq("http://example.com/epg-url")
        expect(channels.first.id).to eq(3)
        expect(channels.first.iepg_name).to eq("DummyiEPGName")
        expect(channels.first.name).to eq("DummyChannelName")
        expect(channels.first.number).to eq(3)
        expect(channels.first.url).to eq("http://example.com/")
      end
    end
  end

  describe "#list_programs" do
    subject do
      client.list_programs(options)
    end

    let(:dummy_programs_response) do
      <<-EOS.strip_heredoc
        <?xml version="1.0" encoding="UTF-8"?>
        <ProgLookupResponse>
          <ProgItems>
            <ProgItem id="1">
              <ChID>3</ChID>
              <Count>1</Count>
              <Deleted>0</Deleted>
              <EdTime>2000-01-01 00:00:00</EdTime>
              <Flag>9</Flag>
              <LastUpdate>2000-01-01 00:00:00</LastUpdate>
              <PID>1</PID>
              <ProgComment>DummyComment</ProgComment>
              <Revision>2</Revision>
              <STSubTitle>DummySubTitle</STSubTitle>
              <StOffset>0</StOffset>
              <StTime>2000-01-01 00:00:00</StTime>
              <SubTitle></SubTitle>
              <TID>2</TID>
              <Warn>1</Warn>
            </ProgItem>
          </ProgItems>
          <Result>
            <Code>200</Code>
            <Message>
            </Message>
          </Result>
        </ProgLookupResponse>
      EOS
    end

    let(:options) do
      {}
    end

    [
      {
        options: {},
        query: {
          Command: "ProgLookup",
          JOIN: "SubTitles",
        },
      },
      {
        options: {
          program_id: 1,
        },
        query: {
          Command: "ProgLookup",
          JOIN: "SubTitles",
          PID: 1,
        },
      },
      {
        options: {
          channel_id: 2,
          program_id: 1,
        },
        query: {
          ChID: 2,
          Command: "ProgLookup",
          JOIN: "SubTitles",
          PID: 1,
        },
      },
      {
        options: {
          count: 1,
        },
        query: {
          Command: "ProgLookup",
          Count: 1,
          JOIN: "SubTitles",
        },
      },
      {
        options: {
          updated_from: ::Time.new(2000, 1, 1),
        },
        query: {
          Command: "ProgLookup",
          JOIN: "SubTitles",
          LastUpdate: "20000101_000000-",
        },
      },
      {
        options: {
          updated_to: ::Time.new(2000, 1, 1),
        },
        query: {
          Command: "ProgLookup",
          JOIN: "SubTitles",
          LastUpdate: "-20000101_000000",
        },
      },
      {
        options: {
          updated_from: ::Time.new(2000, 1, 1),
          updated_to: ::Time.new(2000, 1, 1),
        },
        query: {
          Command: "ProgLookup",
          JOIN: "SubTitles",
          LastUpdate: "20000101_000000-20000101_000000",
        },
      },
      {
        options: {
          started_from: ::Time.new(2000, 1, 1),
        },
        query: {
          Command: "ProgLookup",
          JOIN: "SubTitles", StTime:
          "20000101_000000-",
        },
      },
      {
        options: {
          started_to: ::Time.new(2000, 1, 1),
        },
        query: {
          Command: "ProgLookup",
          JOIN: "SubTitles",
          StTime: "-20000101_000000",
        },
      },
      {
        options: {
          started_from: ::Time.new(2000, 1, 1),
          started_to: ::Time.new(2000, 1, 1),
        },
        query: {
          Command: "ProgLookup",
          JOIN: "SubTitles",
          StTime: "20000101_000000-20000101_000000",
        },
      },
      {
        options: {
          played_from: ::Time.new(2000, 1, 1),
        },
        query: {
          Command: "ProgLookup",
          JOIN: "SubTitles",
          Range: "20000101_000000-",
        },
      },
      {
        options: {
          played_to: ::Time.new(2000, 1, 1),
        },
        query: {
          Command: "ProgLookup",
          JOIN: "SubTitles",
          Range: "-20000101_000000",
        },
      },
      {
        options: {
          played_from: ::Time.new(2000, 1, 1),
          played_to: ::Time.new(2000, 1, 1),
        },
        query: {
          Command: "ProgLookup",
          JOIN: "SubTitles",
          Range: "20000101_000000-20000101_000000",
        },
      },
    ].each do |example|
      context "with options #{example[:options].inspect}" do
        let(:options) do
          example[:options]
        end

        it "sends an HTTP request to http://cal.syoboi.jp/db.php?#{example[:query].to_query}" do
          stub = stub_request(:get, "http://cal.syoboi.jp/db.php?#{example[:query].to_query}").to_return(body: dummy_programs_response)
          subject
          expect(stub).to have_been_made
        end
      end
    end

    context "with real response" do
      let!(:request) do
        stub_request(:get, //).to_return(body: dummy_programs_response)
      end

      it "returns programs" do
        programs = subject
        expect(programs.first.channel_id).to eq(3)
        expect(programs.first.comment).to eq("DummyComment")
        expect(programs.first.count).to eq(1)
        expect(programs.first.deleted?).to eq(false)
        expect(programs.first.finished_at).to eq(Time.parse("2000-01-01 00:00:00"))
        expect(programs.first.flag).to eq(9)
        expect(programs.first.id).to eq(1)
        expect(programs.first.revision).to eq(2)
        expect(programs.first.started_at).to eq(Time.parse("2000-01-01 00:00:00"))
        expect(programs.first.sub_title).to eq("DummySubTitle")
        expect(programs.first.title_id).to eq(2)
        expect(programs.first.updated_at).to eq(Time.parse("2000-01-01 00:00:00"))
        expect(programs.first.warn).to eq(1)
      end
    end
  end

  describe "#list_titles" do
    subject do
      client.list_titles(options)
    end

    let(:dummy_titles_response) do
      <<-EOS.strip_heredoc
        <?xml version="1.0" encoding="UTF-8"?>
        <TitleLookupResponse>
          <Result>
            <Code>200</Code>
            <Message>
            </Message>
          </Result>
          <TitleItems>
            <TitleItem id="2">
              <Cat>4</Cat>
              <Comment>DummyComment</Comment>
              <FirstCh>DummyChannel</FirstCh>
              <FirstEndMonth>1</FirstEndMonth>
              <FirstEndYear>2000</FirstEndYear>
              <FirstMonth>1</FirstMonth>
              <FirstYear>2000</FirstYear>
              <Keywords>DummyKeywords</Keywords>
              <LastUpdate>2000-01-01 00:00:00</LastUpdate>
              <ShortTitle>DummyShortTitle</ShortTitle>
              <SubTitles>DummySubTitles</SubTitles>
              <TID>2</TID>
              <Title>DummyTitle</Title>
              <TitleEN>DummyEnglishTitle</TitleEN>
              <TitleFlag>0</TitleFlag>
              <TitleYomi>ダミータイトル</TitleYomi>
              <UserPoint>6</UserPoint>
              <UserPointRank>1</UserPointRank>
            </TitleItem>
          </TitleItems>
        </TitleLookupResponse>
      EOS
    end

    let(:options) do
      {}
    end

    [
      {
        options: {},
        query: {
          Command: "TitleLookup",
          TID: "*",
        },
      },
      {
        options: {
          title_id: 1,
        },
        query: {
          Command: "TitleLookup",
          TID: 1,
        },
      },
      {
        options: {
          updated_from: ::Time.new(2000, 1, 1),
        },
        query: {
          Command: "TitleLookup",
          LastUpdate: "20000101_000000-",
          TID: "*",
        },
      },
      {
        options: {
          updated_to: ::Time.new(2000, 1, 1),
        },
        query: {
          Command: "TitleLookup",
          LastUpdate: "-20000101_000000",
          TID: "*",
        },
      },
      {
        options: {
          updated_from: ::Time.new(2000, 1, 1),
          updated_to: ::Time.new(2000, 1, 1),
          TID: "*",
        },
        query: {
          Command: "TitleLookup",
          LastUpdate: "20000101_000000-20000101_000000",
          TID: "*",
        },
      },
    ].each do |example|
      context "with options #{example[:options].inspect}" do
        let(:options) do
          example[:options]
        end

        it "sends an HTTP request to http://cal.syoboi.jp/db.php?#{example[:query].to_query}" do
          stub = stub_request(:get, "http://cal.syoboi.jp/db.php?#{example[:query].to_query}").to_return(body: dummy_titles_response)
          subject
          expect(stub).to have_been_made
        end
      end
    end

    context "with real response" do
      let!(:request) do
        stub_request(:get, //).to_return(body: dummy_titles_response)
      end

      it "returns titles" do
        titles = subject
        expect(titles.first.category_id).to eq(4)
        expect(titles.first.comment).to be_a(::SyoboiCalendar::Comment)
        expect(titles.first.first_channel).to eq("DummyChannel")
        expect(titles.first.first_end_month).to eq(1)
        expect(titles.first.first_end_year).to eq(2000)
        expect(titles.first.first_month).to eq(1)
        expect(titles.first.first_year).to eq(2000)
        expect(titles.first.keywords).to eq("DummyKeywords")
        expect(titles.first.short_title).to eq("DummyShortTitle")
        expect(titles.first.sub_titles).to eq("DummySubTitles")
        expect(titles.first.id).to eq(2)
        expect(titles.first.name).to eq("DummyTitle")
        expect(titles.first.english_name).to eq("DummyEnglishTitle")
        expect(titles.first.flag).to eq(0)
        expect(titles.first.kana).to eq("ダミータイトル")
        expect(titles.first.user_point).to eq(6)
        expect(titles.first.user_point_rank).to eq(1)
      end
    end
  end
end
