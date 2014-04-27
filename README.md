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
Supported API request examples: (o: Supported, x: ToDo)

```
o GET http://cal.syoboi.jp/db.php?Command=ProgLookup&JOIN=SubTitles
x GET http://cal.syoboi.jp/db.php?Command=ProgLookup&JOIN=SubTitles&ChID=:channelID
x GET http://cal.syoboi.jp/db.php?Command=ProgLookup&JOIN=SubTitles&Count=:count
x GET http://cal.syoboi.jp/db.php?Command=ProgLookup&JOIN=SubTitles&PID=:id
x GET http://cal.syoboi.jp/db.php?Command=ProgLookup&JOIN=SubTitles&PID=:id
x GET http://cal.syoboi.jp/db.php?Command=ProgLookup&JOIN=SubTitles&Range=-:playedTo
x GET http://cal.syoboi.jp/db.php?Command=ProgLookup&JOIN=SubTitles&Range=:playedFrom-
x GET http://cal.syoboi.jp/db.php?Command=ProgLookup&JOIN=SubTitles&Range=:playedFrom-:playedTo
x GET http://cal.syoboi.jp/db.php?Command=ProgLookup&JOIN=SubTitles&StTime=-:startedTo
o GET http://cal.syoboi.jp/db.php?Command=TitleLookup
x GET http://cal.syoboi.jp/db.php?Command=TitleLookup&LastUpdate=-:updatedTo&TID=*
x GET http://cal.syoboi.jp/db.php?Command=TitleLookup&LastUpdate=:updatedFrom-&TID=*
x GET http://cal.syoboi.jp/db.php?Command=TitleLookup&LastUpdate=:updatedFrom-:updatedTo&TID=*
x GET http://cal.syoboi.jp/db.php?Command=TitleLookup&TID=:id
o GET http://cal.syoboi.jp/db.php?Command=ChLookup
x GET http://cal.syoboi.jp/db.php?Command=ChLookup&ChID=:id
x GET http://cal.syoboi.jp/db.php?Command=ChLookup&LastUpdate=:updatedFrom-:updatedTo
x GET http://cal.syoboi.jp/db.php?Command=ChLookup&LastUpdate=:updatedFrom-
x GET http://cal.syoboi.jp/db.php?Command=ChLookup&LastUpdate=-:updatedTo
```
