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

## API
Supported API request examples: (✔: Supported, ✗: ToDo)

```
✔ GET http://cal.syoboi.jp/db.php?Command=ProgLookup
✗ GET http://cal.syoboi.jp/db.php?Command=ProgLookup&JOIN=SubTitles&ChID=:channelID
✗ GET http://cal.syoboi.jp/db.php?Command=ProgLookup&JOIN=SubTitles&Count=:count
✗ GET http://cal.syoboi.jp/db.php?Command=ProgLookup&JOIN=SubTitles&PID=:id
✗ GET http://cal.syoboi.jp/db.php?Command=ProgLookup&JOIN=SubTitles&PID=:id
✗ GET http://cal.syoboi.jp/db.php?Command=ProgLookup&JOIN=SubTitles&Range=-:playedTo
✗ GET http://cal.syoboi.jp/db.php?Command=ProgLookup&JOIN=SubTitles&Range=:playedFrom-
✗ GET http://cal.syoboi.jp/db.php?Command=ProgLookup&JOIN=SubTitles&Range=:playedFrom-:playedTo
✗ GET http://cal.syoboi.jp/db.php?Command=ProgLookup&JOIN=SubTitles&StTime=-:startedTo
✔ GET http://cal.syoboi.jp/db.php?Command=TitleLookup
✗ GET http://cal.syoboi.jp/db.php?Command=TitleLookup&LastUpdate=-:updatedTo&TID=*
✗ GET http://cal.syoboi.jp/db.php?Command=TitleLookup&LastUpdate=:updatedFrom-&TID=*
✗ GET http://cal.syoboi.jp/db.php?Command=TitleLookup&LastUpdate=:updatedFrom-:updatedTo&TID=*
✗ GET http://cal.syoboi.jp/db.php?Command=TitleLookup&TID=:id
✔ GET http://cal.syoboi.jp/db.php?Command=ChLookup
✗ GET http://cal.syoboi.jp/db.php?Command=ChLookup&ChID=:id
✗ GET http://cal.syoboi.jp/db.php?Command=ChLookup&LastUpdate=:updatedFrom-:updatedTo
✗ GET http://cal.syoboi.jp/db.php?Command=ChLookup&LastUpdate=:updatedFrom-
✗ GET http://cal.syoboi.jp/db.php?Command=ChLookup&LastUpdate=-:updatedTo
```
