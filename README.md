# SyoboiCalendar
Search Japanese anime from [SyoboiCalendar](http://cal.syoboi.jp/).

## Installation
```
# Gemfile
gem "syoboi_calendar"
```

## Usage
```
require "syoboi_calendar"
require "date"

client = SyoboiCalendar::Client.new(
  :user => "username",
  :pass => "password"
)
programs = client.search(
  :first => true,
  :range => Date.today .. Date.today + 7
)

programs[0].name         #=> "さんかれあ #1 私が…ゾンビに…なったら"
programs[0].start_time   #=> 2012-04-06 02:50:00 +0900
programs[0].channel_name #=> "TBS"
```
