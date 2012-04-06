# encoding: UTF-8

$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require "syoboi_calendar"

require "slop"
args = Slop.parse :help => true do
  banner "usage: \n    ruby #{__FILE__}"
  on :r, :range=, "Date range (ex. 2012/4/1-2012/4/30)"
  on :k, :keyword=, "Keyword for title (ex. ひだまりスケッチ)"
end
unless args[:keyword]
  puts args.to_s.gsub(/\n\n/, "\n")
  exit
end

client = SyoboiCalendar::Client.new
titles = client.search(
  :mode    => :title,
  :keyword => args[:keyword],
)
