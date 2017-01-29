# SyoboiCalendar

[![Gem Version](https://badge.fury.io/rb/syoboi_calendar.svg)](https://rubygems.org/gems/syoboi_calendar)
[![CircleCI](https://img.shields.io/circleci/project/r7kamura/syoboi_calendar.svg)](https://circleci.com/gh/r7kamura/syoboi_calendar)
[![Documentation](http://img.shields.io/badge/docs-rdoc.info-blue.svg)](http://www.rubydoc.info/github/r7kamura/syoboi_calendar)

An API Client library for http://cal.syoboi.jp/ written in Ruby.

## Requirements

- Ruby 2.2.2 or higher

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

### Create an instance of `SyoboiCalendar::Client`

```ruby
require "syoboi_calendar"
client = SyoboiCalendar::Client.new
```

### List channels

```ruby
# Sends an HTTP request to http://cal.syoboi.jp/db.php?Command=ChLookup
client.list_channels

# Sends an HTTP request to http://cal.syoboi.jp/db.php?ChID=1&Command=ChLookup
client.list_channels(channel_id: 1)

# Sends an HTTP request to http://cal.syoboi.jp/db.php?Command=ChLookup&LastUpdate=20000101_000000-
client.list_channels(updated_from: Time.new(2000, 1, 1))

# Sends an HTTP request to http://cal.syoboi.jp/db.php?Command=ChLookup&LastUpdate=-20000101_000000
client.list_channels(updated_to: Time.new(2000, 1, 1))

# Sends an HTTP request to http://cal.syoboi.jp/db.php?Command=ChLookup&LastUpdate=20000101_000000-20000201_000000
client.list_channels(updated_from: Time.new(2000, 1, 1), updated_to: Time.new(2000, 2, 1))
```

### List programs

```ruby
# Sends an HTTP request to http://cal.syoboi.jp/db.php?Command=ProgLookup&JOIN=SubTitles
client.list_programs

# Sends an HTTP request to http://cal.syoboi.jp/db.php?Command=ProgLookup&JOIN=SubTitles&PID=1
client.list_programs(program_id: 1)

# Sends an HTTP request to http://cal.syoboi.jp/db.php?ChID=2&Command=ProgLookup&JOIN=SubTitles&PID=1
client.list_programs(program_id: 1, channel_id: 2)

# Sends an HTTP request to http://cal.syoboi.jp/db.php?Command=ProgLookup&Count=1&JOIN=SubTitles
client.list_programs(count: 1)

# Sends an HTTP request to http://cal.syoboi.jp/db.php?Command=ProgLookup&JOIN=SubTitles&LastUpdate=20000101_000000-
client.list_programs(updated_from: Time.new(2000, 1, 1))

# Sends an HTTP request to http://cal.syoboi.jp/db.php?Command=ProgLookup&JOIN=SubTitles&LastUpdate=-20000101_000000
client.list_programs(updated_to: Time.new(2000, 1, 1))

# Sends an HTTP request to http://cal.syoboi.jp/db.php?Command=ProgLookup&JOIN=SubTitles&LastUpdate=20000101_000000-20000201_000000
client.list_programs(updated_from: Time.new(2000, 1, 1), updated_to: Time.new(2000, 2, 1))

# Sends an HTTP request to http://cal.syoboi.jp/db.php?Command=ProgLookup&JOIN=SubTitles&StTime=20000101_000000-
client.list_programs(started_from: Time.new(2000, 1, 1))

# Sends an HTTP request to http://cal.syoboi.jp/db.php?Command=ProgLookup&JOIN=SubTitles&StTime=-20000101_000000
client.list_programs(started_to: Time.new(2000, 1, 1))

# Sends an HTTP request to http://cal.syoboi.jp/db.php?Command=ProgLookup&JOIN=SubTitles&StTime=20000101_000000-20000201_000000
client.list_programs(started_from: Time.new(2000, 1, 1), started_to: Time.new(2000, 2, 1))

# Sends an HTTP request to http://cal.syoboi.jp/db.php?Command=ProgLookup&JOIN=SubTitles&Range=20000101_000000-
client.list_programs(played_from: Time.new(2000, 1, 1))

# Sends an HTTP request to http://cal.syoboi.jp/db.php?Command=ProgLookup&JOIN=SubTitles&Range=-20000101_000000
client.list_programs(played_to: Time.new(2000, 1, 1))

# Sends an HTTP request to http://cal.syoboi.jp/db.php?Command=ProgLookup&JOIN=SubTitles&Range=20000101_000000-20000201_000000
client.list_programs(played_from: Time.new(2000, 1, 1), played_to: Time.new(2000, 2, 1))
```

### List titles

```ruby
# Sends an HTTP request to http://cal.syoboi.jp/db.php?Command=TitleLookup
client.list_titles

# Sends an HTTP request to http://cal.syoboi.jp/db.php?Command=TitleLookup&TID=1
client.list_titles(title_id: 1)

# Sends an HTTP request to http://cal.syoboi.jp/db.php?Command=TitleLookup&LastUpdate=20000101_000000-
client.list_titles(updated_from: Time.new(2000, 1, 1))

# Sends an HTTP request to http://cal.syoboi.jp/db.php?Command=TitleLookup&LastUpdate=-20000101_000000
client.list_titles(updated_to: Time.new(2000, 1, 1))

# Sends an HTTP request to http://cal.syoboi.jp/db.php?Command=TitleLookup&LastUpdate=20000101_000000-20000201_000000
client.list_titles(updated_from: Time.new(2000, 1, 1), updated_to: Time.new(2000, 2, 1))
```

## Resources

SyoboiCalendar::Client returns an Array of resources.

### SyoboiCalendar::Resources::Channel

- comment
- epg_url
- group_id
- id
- iepg_name
- name
- number
- url


### SyoboiCalendar::Resources::Title

- category_id
- comment
- first_channel
- first_end_month
- first_end_year
- first_month
- first_year
- keywords
- short_title
- sub_titles
- id
- name
- english_name
- flag
- kana
- point
- rank

### SyoboiCalendar::Resources::Program

- channel_id
- comment
- count
- deleted?
- finished_at
- flag
- id
- revision
- started_at
- sub_title
- title_id
- updated_at
- warn

## Eager Loading

Client#programs supports `:include` option for eage-loading related resources.

```ruby
programs = client.programs(include: [:channel, :title])
programs.first.channel #=> SyoboiCalendar::Resources::Channel
programs.first.title   #=> SyoboiCalendar::Resources::title
```

## Documentation

See API documentation at http://www.rubydoc.info/github/r7kamura/syoboi_calendar.
