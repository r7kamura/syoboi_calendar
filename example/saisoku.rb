$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require "syoboi_calendar"

args = Slop.parse :help => true do
  on :u, :user=, "Username on SyoboiCalendar"
  on :p, :pass=, "Password on SyoboiCalendar"
  on :d, :debug, "Enable debug mode"
end

if args.debug?
  require "bundler/setup"
  Bundler.require(:debug)
end

client = SyoboiCalendar::Client.new(args)
saisoku = client.search(
  :first => true,
  :range => "2012/4/1-2012/4/30"
).uniq(&:title).select(&:is_saisoku?).sort { |a, b|
  a.start_time.to_i <=> b.start_time.to_i
}.each { |item|
  puts "%s %s" % [
    Time.at(item.start_time.to_i).strftime("%Y-%m-%d %H:%M"),
    item.title
  ]
}
require "pry"; binding.pry
