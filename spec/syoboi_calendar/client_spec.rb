require "spec_helper"

describe "SyoboiCalendar::Client" do
  before do
    user = "testuserforruby"
    pass = user
    @client = SyoboiCalendar::Client.new(:user => user, :pass => pass)
    @guest  = SyoboiCalendar::Client.new
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
