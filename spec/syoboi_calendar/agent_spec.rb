require "spec_helper"

describe "SyoboiCalendar::Agent" do
  describe "#initialize" do
    before do
      login_url      = SyoboiCalendar::Agent::LOGIN_URL
      search_url     = SyoboiCalendar::Agent::SEARCH_URL
      stub_request(:post, /.*#{Regexp.escape(login_url)}.*/)
      stub_request(:get,  /.*#{Regexp.escape(login_url)}.*/).\
        to_return(
          :body => SyoboiCalendar::Fixture.response_from_login,
          :headers => { "Content-Type" => "text/html" }
      )
    end

    context "when passed user and pass" do
      it do
        user = "user"
        pass = "pass"
        agent = SyoboiCalendar::Agent.new(
          :user => user,
          :pass => pass,
        )
        agent.should be_login
      end
    end

    context "when not passed user and pass" do
      it do
        agent = SyoboiCalendar::Agent.new
        agent.should_not be_login
      end
    end
  end
end

