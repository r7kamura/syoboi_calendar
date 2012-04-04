# encoding: UTF-8

$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require "syoboi_calendar"

args = Slop.parse :help => true do
  on :u, :user=, "Username on SyoboiCalendar"
  on :p, :pass=, "Password on SyoboiCalendar"
end

client = SyoboiCalendar::Client.new(
  :user => args[:user],
  :pass => args[:pass]
)
programs = client.search(
  :first => true,
  :range => "2012/4/1-2012/4/30"
)

programs.uniq!(&:title)
programs.select!(&:is_saisoku?)
programs.sort! { |a, b| a.start_time.to_i <=> b.start_time.to_i}
programs.each { |program|
  puts "|%s|%-8.8s|%s|" % [
    program.start_time.strftime("%Y-%m-%d %H:%M"),
    program.saisoku_channel_name\
      .tr("A-Z", "Ａ-Ｚ").tr("a-z", "ａ-ｚ").tr(" ", ""),
    program.title,
  ]
}
