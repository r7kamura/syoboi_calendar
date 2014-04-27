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
Supported API request examples:

```
GET http://cal.syoboi.jp/db.php?Command=ProgLookup&JOIN=SubTitles
GET http://cal.syoboi.jp/db.php?Command=ProgLookup&JOIN=SubTitles&ChID=:channelID
GET http://cal.syoboi.jp/db.php?Command=ProgLookup&JOIN=SubTitles&Count=:count
GET http://cal.syoboi.jp/db.php?Command=ProgLookup&JOIN=SubTitles&PID=:id
GET http://cal.syoboi.jp/db.php?Command=ProgLookup&JOIN=SubTitles&PID=:id
GET http://cal.syoboi.jp/db.php?Command=ProgLookup&JOIN=SubTitles&Range=-:playedTo
GET http://cal.syoboi.jp/db.php?Command=ProgLookup&JOIN=SubTitles&Range=:playedFrom-
GET http://cal.syoboi.jp/db.php?Command=ProgLookup&JOIN=SubTitles&Range=:playedFrom-:playedTo
GET http://cal.syoboi.jp/db.php?Command=ProgLookup&JOIN=SubTitles&StTime=-:startedTo
GET http://cal.syoboi.jp/db.php?Command=TitleLookup
GET http://cal.syoboi.jp/db.php?Command=TitleLookup&LastUpdate=-:updatedTo&TID=*
GET http://cal.syoboi.jp/db.php?Command=TitleLookup&LastUpdate=:updatedFrom-&TID=*
GET http://cal.syoboi.jp/db.php?Command=TitleLookup&LastUpdate=:updatedFrom-:updatedTo&TID=*
GET http://cal.syoboi.jp/db.php?Command=TitleLookup&TID=:id
GET http://cal.syoboi.jp/db.php?Command=ChLookup
GET http://cal.syoboi.jp/db.php?Command=ChLookup&ChID=:id
GET http://cal.syoboi.jp/db.php?Command=ChLookup&LastUpdate=:updatedFrom-:updatedTo
GET http://cal.syoboi.jp/db.php?Command=ChLookup&LastUpdate=:updatedFrom-
GET http://cal.syoboi.jp/db.php?Command=ChLookup&LastUpdate=-:updatedTo
```

## Interface
SyoboiCalender::Client has `#channels`, `#titles`, `#programs` methods.

```
SyoboiCalendar::Client
  #channels
    with options {}
      sends request with Command=ChLookup
    with options {:channel_id=>1}
      sends request with ChID=1&Command=ChLookup
    with options {:updated_from=>2000-01-01 00:00:00 UTC}
      sends request with Command=ChLookup&LastUpdate=20000101_000000-
    with options {:updated_to=>2000-01-01 00:00:00 UTC}
      sends request with Command=ChLookup&LastUpdate=-20000101_000000
    with options {:updated_from=>2000-01-01 00:00:00 UTC, :updated_to=>2000-01-01 00:00:00 UTC}
      sends request with Command=ChLookup&LastUpdate=20000101_000000-20000101_000000
  #titles
    with options {}
      sends request with Command=TitleLookup
    with options {:title_id=>1}
      sends request with Command=TitleLookup&TID=1
    with options {:updated_from=>2000-01-01 00:00:00 UTC}
      sends request with Command=TitleLookup&LastUpdate=20000101_000000-
    with options {:updated_to=>2000-01-01 00:00:00 UTC}
      sends request with Command=TitleLookup&LastUpdate=-20000101_000000
    with options {:updated_from=>2000-01-01 00:00:00 UTC, :updated_to=>2000-01-01 00:00:00 UTC}
      sends request with Command=TitleLookup&LastUpdate=20000101_000000-20000101_000000
  #programs
    with options {}
      sends request with Command=ProgLookup&JOIN=SubTitles
    with options {:program_id=>1}
      sends request with Command=ProgLookup&JOIN=SubTitles&PID=1
    with options {:program_id=>1, :channel_id=>2}
      sends request with ChID=2&Command=ProgLookup&JOIN=SubTitles&PID=1
    with options {:count=>1}
      sends request with Command=ProgLookup&Count=1&JOIN=SubTitles
    with options {:updated_from=>2000-01-01 00:00:00 UTC}
      sends request with Command=ProgLookup&JOIN=SubTitles&LastUpdate=20000101_000000-
    with options {:updated_to=>2000-01-01 00:00:00 UTC}
      sends request with Command=ProgLookup&JOIN=SubTitles&LastUpdate=-20000101_000000
    with options {:updated_from=>2000-01-01 00:00:00 UTC, :updated_to=>2000-01-01 00:00:00 UTC}
      sends request with Command=ProgLookup&JOIN=SubTitles&LastUpdate=20000101_000000-20000101_000000
    with options {:started_from=>2000-01-01 00:00:00 UTC}
      sends request with Command=ProgLookup&JOIN=SubTitles&StTime=20000101_000000-
    with options {:started_to=>2000-01-01 00:00:00 UTC}
      sends request with Command=ProgLookup&JOIN=SubTitles&StTime=-20000101_000000
    with options {:started_from=>2000-01-01 00:00:00 UTC, :started_to=>2000-01-01 00:00:00 UTC}
      sends request with Command=ProgLookup&JOIN=SubTitles&StTime=20000101_000000-20000101_000000
    with options {:played_from=>2000-01-01 00:00:00 UTC}
      sends request with Command=ProgLookup&JOIN=SubTitles&Range=20000101_000000-
    with options {:played_to=>2000-01-01 00:00:00 UTC}
      sends request with Command=ProgLookup&JOIN=SubTitles&Range=-20000101_000000
    with options {:played_from=>2000-01-01 00:00:00 UTC, :played_to=>2000-01-01 00:00:00 UTC}
      sends request with Command=ProgLookup&JOIN=SubTitles&Range=20000101_000000-20000101_000000
```
