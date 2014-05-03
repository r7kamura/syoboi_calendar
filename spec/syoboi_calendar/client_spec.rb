require "spec_helper"
require "active_support/core_ext/object/to_query"

describe SyoboiCalendar::Client do
  before do
    stub_request(:any, //)
  end

  let(:client) do
    described_class.new
  end

  let!(:request) do
    stub_request(:get, "http://cal.syoboi.jp/db.php?#{query.to_query}")
  end

  let(:call) do
    client.send(method_name, options)
  end

  let(:options) do
    {}
  end

  let(:query) do
    {}
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

  let(:app) do
    ->(env) do
      [
        200,
        { "Content-type" => "application/xml" },
        [
          case env["QUERY_STRING"]
          when /ProgLookup/
            dummy_programs_response
          when /ChLookup/
            dummy_channels_response
          else
            dummy_titles_response
          end,
        ],
      ]
    end
  end

  subject do
    call
    request
  end

  describe "#channels" do
    let(:method_name) do
      :channels
    end

    [
      {
        options: {},
        query: { Command: "ChLookup" },
      },
      {
        options: { channel_id: 1 },
        query: { Command: "ChLookup", ChID: 1 },
      },
      {
        options: { updated_from: Time.utc(2000) },
        query: { Command: "ChLookup", LastUpdate: "20000101_000000-" },
      },
      {
        options: { updated_to: Time.utc(2000) },
        query: { Command: "ChLookup", LastUpdate: "-20000101_000000" },
      },
      {
        options: { updated_from: Time.utc(2000), updated_to: Time.utc(2000) },
        query: { Command: "ChLookup", LastUpdate: "20000101_000000-20000101_000000" },
      },
    ].each do |hash|
      context "with options #{hash[:options].inspect}" do
        let(:options) do
          hash[:options]
        end

        let(:query) do
          hash[:query]
        end

        it "requests to http://cal.syoboi.jp/db.php?#{hash[:query].to_query}" do
          should have_been_made
        end
      end
    end

    context "with real response" do
      let!(:request) do
        stub_request(:get, //).to_rack(app)
      end

      it "returns an Array of SyoboiCalendar::Resources::Channel" do
        channels = client.channels
        channels[0].should be_a SyoboiCalendar::Resources::Channel
        channels[0].comment.should == "DummyComment"
        channels[0].epg_url.should == "http://example.com/epg-url"
        channels[0].group_id.should == 1
        channels[0].id.should == 3
        channels[0].iepg_name.should == "DummyiEPGName"
        channels[0].name.should == "DummyChannelName"
        channels[0].number.should == 3
        channels[0].url.should == "http://example.com/"
      end
    end
  end

  describe "#titles" do
    let(:method_name) do
      :titles
    end

    [
      {
        options: {},
        query: { Command: "TitleLookup" },
      },
      {
        options: { title_id: 1 },
        query: { Command: "TitleLookup", TID: 1 },
      },
      {
        options: { updated_from: Time.utc(2000) },
        query: { Command: "TitleLookup", LastUpdate: "20000101_000000-" },
      },
      {
        options: { updated_to: Time.utc(2000) },
        query: { Command: "TitleLookup", LastUpdate: "-20000101_000000" },
      },
      {
        options: { updated_from: Time.utc(2000), updated_to: Time.utc(2000) },
        query: { Command: "TitleLookup", LastUpdate: "20000101_000000-20000101_000000" },
      },
    ].each do |hash|
      context "with options #{hash[:options].inspect}" do
        let(:options) do
          hash[:options]
        end

        let(:query) do
          hash[:query]
        end

        it "requests to http://cal.syoboi.jp/db.php?#{hash[:query].to_query}" do
          should have_been_made
        end
      end
    end

    context "with real response" do
      let!(:request) do
        stub_request(:get, //).to_rack(app)
      end

      it "returns an Array of SyoboiCalendar::Resources::Title" do
        titles = client.titles
        titles[0].should be_a SyoboiCalendar::Resources::Title
        titles[0].category_id.should == 4
        titles[0].comment.should == "DummyComment"
        titles[0].first_channel.should == "DummyChannel"
        titles[0].first_end_month.should == 1
        titles[0].first_end_year.should == 2000
        titles[0].first_month.should == 1
        titles[0].first_year.should == 2000
        titles[0].keywords.should == "DummyKeywords"
        titles[0].short_title.should == "DummyShortTitle"
        titles[0].sub_titles.should == "DummySubTitles"
        titles[0].id.should == 2
        titles[0].name.should == "DummyTitle"
        titles[0].english_name.should == "DummyEnglishTitle"
        titles[0].flag.should == 0
        titles[0].kana.should == "ダミータイトル"
        titles[0].point.should == 6
        titles[0].rank.should == 1
      end
    end
  end

  describe "#programs" do
    let(:method_name) do
      :programs
    end

    [
      {
        options: {},
        query: { Command: "ProgLookup", JOIN: "SubTitles" },
      },
      {
        options: { program_id: 1 },
        query: { Command: "ProgLookup", JOIN: "SubTitles", PID: 1 },
      },
      {
        options: { program_id: 1, channel_id: 2 },
        query: { Command: "ProgLookup", JOIN: "SubTitles", PID: 1, ChID: 2 },
      },
      {
        options: { count: 1 },
        query: { Command: "ProgLookup", JOIN: "SubTitles", Count: 1 },
      },
      {
        options: { updated_from: Time.utc(2000) },
        query: { Command: "ProgLookup", JOIN: "SubTitles", LastUpdate: "20000101_000000-" },
      },
      {
        options: { updated_to: Time.utc(2000) },
        query: { Command: "ProgLookup", JOIN: "SubTitles", LastUpdate: "-20000101_000000" },
      },
      {
        options: { updated_from: Time.utc(2000), updated_to: Time.utc(2000) },
        query: { Command: "ProgLookup", JOIN: "SubTitles", LastUpdate: "20000101_000000-20000101_000000" },
      },
      {
        options: { started_from: Time.utc(2000) },
        query: { Command: "ProgLookup", JOIN: "SubTitles", StTime: "20000101_000000-" },
      },
      {
        options: { started_to: Time.utc(2000) },
        query: { Command: "ProgLookup", JOIN: "SubTitles", StTime: "-20000101_000000" },
      },
      {
        options: { started_from: Time.utc(2000), started_to: Time.utc(2000) },
        query: { Command: "ProgLookup", JOIN: "SubTitles", StTime: "20000101_000000-20000101_000000" },
      },
      {
        options: { played_from: Time.utc(2000) },
        query: { Command: "ProgLookup", JOIN: "SubTitles", Range: "20000101_000000-" },
      },
      {
        options: { played_to: Time.utc(2000) },
        query: { Command: "ProgLookup", JOIN: "SubTitles", Range: "-20000101_000000" },
      },
      {
        options: { played_from: Time.utc(2000), played_to: Time.utc(2000) },
        query: { Command: "ProgLookup", JOIN: "SubTitles", Range: "20000101_000000-20000101_000000" },
      },
    ].each do |hash|
      context "with options #{hash[:options].inspect}" do
        let(:options) do
          hash[:options]
        end

        let(:query) do
          hash[:query]
        end

        it "requests to http://cal.syoboi.jp/db.php?#{hash[:query].to_query}" do
          should have_been_made
        end
      end
    end

    context "with real response" do
      let!(:request) do
        stub_request(:get, //).to_rack(app)
      end

      it "returns an Array of SyoboiCalendar::Resources::Program" do
        programs = client.programs
        programs[0].should be_a SyoboiCalendar::Resources::Program
        programs[0].channel_id.should == 3
        programs[0].comment.should == "DummyComment"
        programs[0].count.should == 1
        programs[0].deleted?.should == false
        programs[0].finished_at.should == Time.parse("2000-01-01 00:00:00")
        programs[0].flag.should == 9
        programs[0].id.should == 1
        programs[0].revision.should == 2
        programs[0].started_at.should == Time.parse("2000-01-01 00:00:00")
        programs[0].sub_title.should == "DummySubTitle"
        programs[0].title_id.should == 2
        programs[0].updated_at.should == Time.parse("2000-01-01 00:00:00")
        programs[0].warn.should == 1
      end
    end
  end
end
