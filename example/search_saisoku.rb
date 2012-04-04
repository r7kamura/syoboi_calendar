# encoding: UTF-8

$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require "syoboi_calendar"

args = Slop.parse :help => true do
  on :u, :user=, "Username on SyoboiCalendar"
  on :p, :pass=, "Password on SyoboiCalendar"
  on :r, :range=, "Date range (e.g. 2012/4/1-2012/4/30)"
end

client = SyoboiCalendar::Client.new(
  :user => args[:user],
  :pass => args[:pass]
)
programs = client.search(
  :first => true,
  :range => args[:range] || [ # today .. today + 1.month
    Time.now + 0,
    Time.now + 60 * 60 * 24 * 31
  ].map { |i| Time.at(i).strftime("%Y/%m/%d") }.join("-")
)

programs.uniq!(&:title)
programs.select!(&:is_saisoku?)
programs.sort! { |a, b| a.start_time.to_i <=> b.start_time.to_i}
programs.each { |program|
  puts "|%s|%-8.8s|%s|" % [
    program.start_time.strftime("%Y-%m-%d %H:%M"),
    program.channel_name.tr("A-Z", "Ａ-Ｚ").tr("a-z", "ａ-ｚ").tr(" ", ""),
    program.title.gsub(/( #\d+).*/, '\1')
  ]
}
