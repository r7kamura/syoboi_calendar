# SyoboiCalendar

[![Build Status](https://travis-ci.org/r7kamura/syoboi_calendar.png)](https://travis-ci.org/r7kamura/syoboi_calendar)

Search Japanese anime from [SyoboiCalendar](http://cal.syoboi.jp/).

## Installation

Add this line to your application's Gemfile:

```ruby
gem "syoboi_calendar"
```

And then execute:

```bash
bundle
```

Or install it yourself as:

```bash
gem install syoboi_calendar
```

## Usage
```ruby
require "syoboi_calendar"

client = SyoboiCalendar::Client.new
client.channels #=> an Array of SyoboiCalendar::Resources::Channel
client.programs #=> an Array of SyoboiCalendar::Resources::Program
client.titles   #=> an Array of SyoboiCalendar::Resources::Title
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

## Resources
SyoboiCalendar::Client returns an Array of resources.

### SyoboiCalendar::Resources::Channel
* comment
* epg_url
* group_id
* id
* iepg_name
* name
* number
* url


### SyoboiCalendar::Resources::Title
* category_id
* comment
* first_channel
* first_end_month
* first_end_year
* first_month
* first_year
* keywords
* short_title
* sub_titles
* id
* name
* english_name
* flag
* kana
* point
* rank

### SyoboiCalendar::Resources::Program
* channel_id
* comment
* count
* deleted?
* finished_at
* flag
* id
* revision
* started_at
* sub_title
* title_id
* updated_at
* warn

## Eager Loading
Client#programs supports `:include` option for eage-loading related resources.

```ruby
programs = client.programs(include: [:channel, :title])
programs.first.channel #=> SyoboiCalendar::Resources::Channel
programs.first.title   #=> SyoboiCalendar::Resources::title
```
