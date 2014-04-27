# encoding: UTF-8

require "spec_helper"

describe "SyoboiCalendar::Program" do
  before do
    pending
    @program = SyoboiCalendar::Program.new(
      :tid          => 2481,
      :pid          => 217175,
      :name         => "聖闘士星矢Ω #1 星矢によって救われた命！甦れ聖闘士伝説！",
      :channel_name => "テレビ朝日",
    )
  end

  describe "#saisoku?" do
    subject { @program }
    it { should be_saisoku }
  end
end
