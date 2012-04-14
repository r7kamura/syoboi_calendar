# encoding: UTF-8

$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require "syoboi_calendar"

require "slop"
args = Slop.parse :help => true do
  banner "usage: \n    ruby #{__FILE__}"
  on :k, :keyword=, "Keyword for title (ex. ひだまりスケッチ)"
  on :r, :range=, "Date range (ex. 2012/4/1-2012/4/30)"
end
unless args[:keyword]
  puts args.to_s.gsub(/\n\n/, "\n")
  exit
end

client = SyoboiCalendar.new
titles = client.search(
  :mode    => :title,
  :keyword => args[:keyword],
)

require "awesome_print"
titles.each do |title|
  ap title.name
  ap title.url
  ap title.voice_actor_map
  puts
end
