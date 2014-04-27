# SyoboiCalendar
Search Japanese anime from [SyoboiCalendar](http://cal.syoboi.jp/).

## Installation
```ruby
# Gemfile
gem "syoboi_calendar"
```

## Usage
```ruby
require "syoboi_calendar"

client = SyoboiCalendar::Client
client.channels #=> [...]
client.programs #=> [...]
client.titles   #=> [...]
```
