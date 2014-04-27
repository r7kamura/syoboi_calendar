require "spec_helper"

describe SyoboiCalendar::Client do
  before do
    stub_request(:any, //)
  end

  let(:client) do
    described_class.new
  end

  describe "#channels" do
    it "sends HTTP request with Command=ChLookup" do
      client.channels
      a_request(:get, "http://cal.syoboi.jp/db.php?Command=ChLookup").should have_been_made
    end
  end

  describe "#titles" do
    it "sends HTTP request with Command=TitleLookup" do
      client.titles
      a_request(:get, "http://cal.syoboi.jp/db.php?Command=TitleLookup").should have_been_made
    end
  end

  describe "#programs" do
    it "sends HTTP request with Command=ProgLookup" do
      client.programs
      a_request(:get, "http://cal.syoboi.jp/db.php?Command=ProgLookup").should have_been_made
    end
  end
end
