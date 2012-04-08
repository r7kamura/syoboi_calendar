# encoding: UTF-8

require "spec_helper"

describe "SyoboiCalendar::Client" do
  before do
    login_url      = SyoboiCalendar::Agent::LOGIN_URL
    search_url     = SyoboiCalendar::Agent::SEARCH_URL
    login_regexp   = /.*#{Regexp.escape(login_url)}.*/
    title_regexp   = /.*#{Regexp.escape(search_url)}.*sd=0.*/
    program_regexp = /.*#{Regexp.escape(search_url)}.*sd=2.*/

    stub_request(:post, login_regexp)
    stub_request(:get, login_regexp).\
      to_return(
        :body => SyoboiCalendar::Fixture.response_from_login,
        :headers => { "Content-Type" => "text/html" }
      )
    stub_request(:get, program_regexp).\
      to_return(
        :body => SyoboiCalendar::Fixture.response_from_search_programs,
        :headers => { "Content-Type" => "text/html" }
      )
    stub_request(:get, title_regexp).\
      to_return(
        :body => SyoboiCalendar::Fixture.response_from_search_titles,
        :headers => { "Content-Type" => "text/html" }
      )

    user = "testuserforruby"
    pass = user
    @client = SyoboiCalendar::Client.new(:user => user, :pass => pass)
    @guest  = SyoboiCalendar::Client.new
  end

  describe "#search" do
    before do
      @args = { :range => "2012/4/1-2012/4/30" }
    end

    it do
      @client.search(@args).should be_kind_of Array
    end

    context "in default" do
      it "should return Programs" do
        @client.search(@args)[0].should be_kind_of SyoboiCalendar::Program
      end
    end

    context "when specify title mode" do
      it "should return Titles" do
        @guest.search(
          :mode    => :title,
          :keyword => "ひだまりスケッチ"
        )[0].should be_kind_of SyoboiCalendar::Title
      end
    end
  end

  describe "#login?" do
    context "logined user" do
      subject { @client }
      it { should be_login }
    end

    context "guest user" do
      subject { @guest }
      it { should_not be_login }
    end
  end
end
