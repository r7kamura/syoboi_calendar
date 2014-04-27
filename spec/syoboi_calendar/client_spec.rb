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
  end
end
