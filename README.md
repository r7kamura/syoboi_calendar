# SyoboiCalendar

Simple gem for [SyoboiCalendar](http://cal.syoboi.jp/) to search Japanese anime lineup

## Installation

```
$ gem install syoboi_calendar
```

## Usage

```
require "syoboi_calender"

client = SyoboiCalendar.new(
  :user => "r7kamura",
  :pass => "********"
)
programs = client.search(
  :first => true,
  :range => "2012/4/1-2012/4/30"
)

p programs[0].name         #=> "さんかれあ #1 私が…ゾンビに…なったら"
p programs[0].start_time   #=> 2012-04-06 02:50:00 +0900
p programs[0].channel_name #=> "TBS"
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
