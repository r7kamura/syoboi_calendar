# encoding: UTF-8

require "spec_helper"

describe "SyoboiCalendar::Client" do
  before do
    login_url      = SyoboiCalendar::Agent::LOGIN_URL
    search_url     = SyoboiCalendar::Agent::SEARCH_URL

    stub_request(:post, /.*#{Regexp.escape(login_url)}.*/)
    stub_request(:get,  /.*#{Regexp.escape(login_url)}.*/).\
      to_return(
        :body => SyoboiCalendar::Fixture.response_from_login,
        :headers => { "Content-Type" => "text/html" }
      )
    stub_request(:get, /.*#{Regexp.escape(search_url)}.*sd=2.*/).\
      to_return(
        :body => SyoboiCalendar::Fixture.response_from_search_programs,
        :headers => { "Content-Type" => "text/html" }
      )
    stub_request(:get, /.*#{Regexp.escape(search_url)}.*sd=0.*/).\
      to_return(
        :body => SyoboiCalendar::Fixture.response_from_search_titles,
        :headers => { "Content-Type" => "text/html" }
      )

    user = "testuserforruby"
    pass = user
    @client = SyoboiCalendar.new(:user => user, :pass => pass)
    @guest  = SyoboiCalendar.new
  end

  describe "#search" do
    before do
      @args_program = { :range => "2012/4/1-2012/4/30" }
      @args_title   = { :mode => :title, :keyword => "ひだまりスケッチ" }
    end

    it do
      @client.search(@args_program).should be_kind_of Array
    end

    context "in default" do
      subject { @client.search(@args_program)[0] }
      it "should return Programs" do
        should be_kind_of SyoboiCalendar::Program
      end
    end

    context "when passed mode of title" do
      subject { @guest.search(@args_title)[0] }
      it "should return Titles" do
        should be_kind_of SyoboiCalendar::Title
      end
    end
  end

  describe "#login?" do
    context "in logined user" do
      subject { @client }
      it { should be_login }
    end

    context "in guest user" do
      subject { @guest }
      it { should_not be_login }
    end
  end
end
