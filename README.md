# SyoboiCalendar

[![CircleCI](https://img.shields.io/circleci/project/github/r7kamura/syoboi_calendar.svg)](https://circleci.com/gh/r7kamura/syoboi_calendar)
[![Gem Version](https://badge.fury.io/rb/syoboi_calendar.svg)](https://rubygems.org/gems/syoboi_calendar)
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

### SyoboiCalendar::Client.new

Creates an instance of `SyoboiCalendar::Client`.

```ruby
require "syoboi_calendar"
client = SyoboiCalendar::Client.new
```

### SyoboiCalendar::Client#list_channel_groups

Available options:

- `:channel_group_id`
- `:updated_from`
- `:updated_to`

```ruby
client.list_channel_groups
```

```
http://cal.syoboi.jp/db.php?Command=ChGroupLookup
```

### SyoboiCalendar::Client#list_channels

Available options:

- `:channel_id`
- `:updated_from`
- `:updated_to`

```ruby
client.list_channels
```

```
http://cal.syoboi.jp/db.php?Command=ChLookup
```

### SyoboiCalendar::Client#list_programs

Available options:

- `:count`
- `:fields`
- `:played_from`
- `:played_to`
- `:program_id`
- `:started_from`
- `:started_to`
- `:title_id`
- `:updated_from`
- `:updated_to`

```ruby
client.list_programs
```

```
http://cal.syoboi.jp/db.php?Command=ProgLookup&JOIN=SubTitles
```

### SyoboiCalendar::Client#list_titles

Available options:

- `:fields`
- `:title_id`
- `:updated_from`
- `:updated_to`

```ruby
client.list_titles
```

```
http://cal.syoboi.jp/db.php?Command=TitleLookup&TID=*
```

### SyoboiCalendar::Responses::BaseResponse

Available methods:

- `#body`
- `#code`
- `#each`
- `#has_error?`
- `#headers`
- `#message`
- `#resources`
- `#status`

### SyoboiCalendar::Resources::ChannelGroupResource

Available methods:

- `#comment`
- `#id`
- `#name`
- `#order`

### SyoboiCalendar::Resources::ChannelResource

Available methods:

- `#channel_group_id`
- `#comment`
- `#epg_url`
- `#id`
- `#iepg_name`
- `#name`
- `#number`
- `#url`

### SyoboiCalendar::Resources::ProgramResource

Available methods:

- `#channel_id`
- `#comment`
- `#count`
- `#deleted?`
- `#finished_at`
- `#flag`
- `#id`
- `#iepg_name`
- `#rerun?`
- `#revision`
- `#started_at`
- `#sub_title`
- `#title_id`
- `#warn`

### SyoboiCalendar::Resources::TitleResource

Available methods:

- `#casts`
- `#category_id`
- `#comment`
- `#english_name`
- `#first_channel`
- `#first_end_month`
- `#first_end_year`
- `#first_month`
- `#first_year`
- `#flag`
- `#id`
- `#kana`
- `#keywords`
- `#name`
- `#short_title`
- `#songs_ending`
- `#songs_inserted`
- `#songs_opening`
- `#songs_theme`
- `#staffs`
- `#sub_titles`
- `#user_point_rank`
- `#user_point`
