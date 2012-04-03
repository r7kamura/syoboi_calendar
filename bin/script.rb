$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require "syoboi_calendar"

args = Slop.parse :help => true do
  on :u, :user=, "Username"
  on :p, :pass=, "Password"
  on :d, :debug, "Debug mode"
end

if args.debug?
  require "bundler/setup"
  Bundler.require(:debug)
end

client = SyoboiCalendar::Client.new(
  :user => args[:user],
  :pass => args[:pass]
)
client.login
result = client.search(
  :r => 3,
  :rd => "2011/10/1-2011/10/31"
)
require "pry"; binding.pry