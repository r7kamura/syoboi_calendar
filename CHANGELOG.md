## [0.9.4] - 2018-10-12

### Fixed

- Fixed deprecation warning from Faraday.

## 0.9.3

- Fix comment parser logic

## 0.9.2

- Add `SyoboiCalendar::Resources::ProgramResource#rerun?`

## 0.9.1

- Fix bug on personality role name splitting
- Change `SyoboiCalendar::Song` interface

## 0.9.0

- Add `SyoboiCalendar::Resources::TitleResource#casts`
- Add `SyoboiCalendar::Resources::TitleResource#staffs`
- Add `SyoboiCalendar::Resources::TitleResource#songs_ending`
- Add `SyoboiCalendar::Resources::TitleResource#songs_inserted`
- Add `SyoboiCalendar::Resources::TitleResource#songs_opening`
- Add `SyoboiCalendar::Resources::TitleResource#songs_theme`
- Change `SyoboiCalendar::Resources::TitleResource#comment` returned value

## 0.8.0

- Add some methods for error handling
- Add response classes for each API
- Rename query classes
- Deprecate response parser classes

## 0.7.0

- Reveal `BaseResource#source`
- Rename `TitleResource#rank` to `TitleResource#user_point_rank`
- Rename `TitleResource#point` to `TitleResource#user_point`
- Rename `ChannelGroupResource#order_score` to `ChannelGroupResource#order`

## 0.6.1

- Separate response and response parser

## 0.6.0

- Support channel groups
- Change resource attribute name from `group_id` to `channel_group_id`

## 0.5.1

- Support :title_id options on list_programs method
- Support :fields option on list_programs and list_titles
- Support multiple IDs and counts options on client methods

## 0.5.0

- Refactor internal implementation
- Remove `:include` option
- Add `TID=*` query if no `:title_id` option given on `#list_titles`

## 0.4.0

- Change client method names (e..g `#programs` to `#list_programs`)

## 0.3.1

- Client#programs supports `:include` option for eager-loading related resources

## 0.3.0

- SyoboiCalendar::Client returns an Array of resources

## 0.2.1

- SyoboiCalendar::Client returns a Hashie::Mash as a response

## 0.2.0

- Remake SyoboiCalendar::Client from scratch
- Support GET /db.php API

[0.9.4]: https://github.com/r7kamura/syoboi_calendar/compare/v0.9.3...v0.9.4
