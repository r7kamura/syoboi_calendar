## Name
SyoboiCalendar

## About
This is a Ruby Library for [SyoboiCalendar](http://cal.syoboi.jp/).

## Require
* Ruby (>= 1.9.2)

## Install
~~~
git clone git://github.com/r7kamura/SyoboiCalendar.git
cd SyoboiCalendar
gem install bundler
bundle install

# Try example script
ruby example/search_saisoku.rb -u username -p password
~~~

## Example
~~~
require "syoboi_calender"

client = SyoboiCalendar::Client.new(
  :user => "r7kamura",
  :pass => "********"
)
programs = client.search(
  :first => true,
  :range => "2012/4/1-2012/4/30"
)

p programs[0].title         #=> "さんかれあ #1 私が…ゾンビに…なったら"
p programs[0].first_channel #=> "TBS"
p programs[0].start_time    #=> 2012-04-06 02:50:00 +0900
~~~
