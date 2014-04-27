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
client.channels #=> a Hashie::Mash instance
client.programs #=> a Hashie::Mash instance
client.titles   #=> a Hashie::Mash instance
```

## API
SyoboiCalender::Client provides `#channels`, `#titles`, `#programs` methods.

```ruby
SyoboiCalendar::Client
  #channels
    with options {}
      requests to http://cal.syoboi.jp/db.php?Command=ChLookup
    with options {:channel_id=>1}
      requests to http://cal.syoboi.jp/db.php?ChID=1&Command=ChLookup
    with options {:updated_from=>2000-01-01 00:00:00 UTC}
      requests to http://cal.syoboi.jp/db.php?Command=ChLookup&LastUpdate=20000101_000000-
    with options {:updated_to=>2000-01-01 00:00:00 UTC}
      requests to http://cal.syoboi.jp/db.php?Command=ChLookup&LastUpdate=-20000101_000000
    with options {:updated_from=>2000-01-01 00:00:00 UTC, :updated_to=>2000-01-01 00:00:00 UTC}
      requests to http://cal.syoboi.jp/db.php?Command=ChLookup&LastUpdate=20000101_000000-20000101_000000
  #titles
    with options {}
      requests to http://cal.syoboi.jp/db.php?Command=TitleLookup
    with options {:title_id=>1}
      requests to http://cal.syoboi.jp/db.php?Command=TitleLookup&TID=1
    with options {:updated_from=>2000-01-01 00:00:00 UTC}
      requests to http://cal.syoboi.jp/db.php?Command=TitleLookup&LastUpdate=20000101_000000-
    with options {:updated_to=>2000-01-01 00:00:00 UTC}
      requests to http://cal.syoboi.jp/db.php?Command=TitleLookup&LastUpdate=-20000101_000000
    with options {:updated_from=>2000-01-01 00:00:00 UTC, :updated_to=>2000-01-01 00:00:00 UTC}
      requests to http://cal.syoboi.jp/db.php?Command=TitleLookup&LastUpdate=20000101_000000-20000101_000000
  #programs
    with options {}
      requests to http://cal.syoboi.jp/db.php?Command=ProgLookup&JOIN=SubTitles
    with options {:program_id=>1}
      requests to http://cal.syoboi.jp/db.php?Command=ProgLookup&JOIN=SubTitles&PID=1
    with options {:program_id=>1, :channel_id=>2}
      requests to http://cal.syoboi.jp/db.php?ChID=2&Command=ProgLookup&JOIN=SubTitles&PID=1
    with options {:count=>1}
      requests to http://cal.syoboi.jp/db.php?Command=ProgLookup&Count=1&JOIN=SubTitles
    with options {:updated_from=>2000-01-01 00:00:00 UTC}
      requests to http://cal.syoboi.jp/db.php?Command=ProgLookup&JOIN=SubTitles&LastUpdate=20000101_000000-
    with options {:updated_to=>2000-01-01 00:00:00 UTC}
      requests to http://cal.syoboi.jp/db.php?Command=ProgLookup&JOIN=SubTitles&LastUpdate=-20000101_000000
    with options {:updated_from=>2000-01-01 00:00:00 UTC, :updated_to=>2000-01-01 00:00:00 UTC}
      requests to http://cal.syoboi.jp/db.php?Command=ProgLookup&JOIN=SubTitles&LastUpdate=20000101_000000-20000101_000000
    with options {:started_from=>2000-01-01 00:00:00 UTC}
      requests to http://cal.syoboi.jp/db.php?Command=ProgLookup&JOIN=SubTitles&StTime=20000101_000000-
    with options {:started_to=>2000-01-01 00:00:00 UTC}
      requests to http://cal.syoboi.jp/db.php?Command=ProgLookup&JOIN=SubTitles&StTime=-20000101_000000
    with options {:started_from=>2000-01-01 00:00:00 UTC, :started_to=>2000-01-01 00:00:00 UTC}
      requests to http://cal.syoboi.jp/db.php?Command=ProgLookup&JOIN=SubTitles&StTime=20000101_000000-20000101_000000
    with options {:played_from=>2000-01-01 00:00:00 UTC}
      requests to http://cal.syoboi.jp/db.php?Command=ProgLookup&JOIN=SubTitles&Range=20000101_000000-
    with options {:played_to=>2000-01-01 00:00:00 UTC}
      requests to http://cal.syoboi.jp/db.php?Command=ProgLookup&JOIN=SubTitles&Range=-20000101_000000
    with options {:played_from=>2000-01-01 00:00:00 UTC, :played_to=>2000-01-01 00:00:00 UTC}
      requests to http://cal.syoboi.jp/db.php?Command=ProgLookup&JOIN=SubTitles&Range=20000101_000000-20000101_000000
```
