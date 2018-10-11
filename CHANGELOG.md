## [0.9.4] - 2018-10-12

### Fixed

- Fix deprecation warning from Faraday.

## [0.9.3] - 2017-02-20

### Fixed

- Fix comment parser logic.

## [0.9.2] - 2017-02-17

### Added

- Add `SyoboiCalendar::Resources::ProgramResource#rerun?`.

## [0.9.1] - 2017-02-12

### Changed

- Change `SyoboiCalendar::Song` interface.

### Fixed

- Fix bug on personality role name splitting.

## [0.9.0] - 2017-02-12

### Added

- Add `SyoboiCalendar::Resources::TitleResource#casts`.
- Add `SyoboiCalendar::Resources::TitleResource#staffs`.
- Add `SyoboiCalendar::Resources::TitleResource#songs_ending`.
- Add `SyoboiCalendar::Resources::TitleResource#songs_inserted`.
- Add `SyoboiCalendar::Resources::TitleResource#songs_opening`.
- Add `SyoboiCalendar::Resources::TitleResource#songs_theme`.

### Changed

- Change `SyoboiCalendar::Resources::TitleResource#comment` returned value.

## [0.8.0] - 2017-02-10

### Added

- Add some methods for error handling.
- Add response classes for each API.

### Changed

- Rename query classes.

### Removed

- Remove response parser classes.

## [0.7.0] - 2017-02-06

### Added

- Reveal `BaseResource#source`.

### Changed

- Rename `TitleResource#rank` to `TitleResource#user_point_rank`.
- Rename `TitleResource#point` to `TitleResource#user_point`.
- Rename `ChannelGroupResource#order_score` to `ChannelGroupResource#order`.

## [0.6.1] - 2017-02-06

### Changed

- Separate response and response parser.

## [0.6.0] - 2017-02-06

### Added

- Support channel groups.

### Changed

- Change resource attribute name from `group_id` to `channel_group_id`.

## [0.5.1] - 2017-02-02

### Added

- Support :title_id options on list_programs method.
- Support :fields option on list_programs and list_titles.
- Support multiple IDs and counts options on client methods.

## [0.5.0] - 2017-01-29

### Added

- Add `TID=*` query if no `:title_id` option given on `#list_titles`.

### Changed

- Refactor internal implementation.

### Removed

- Remove `:include` option.

## [0.4.0] - 2017-01-29

### Changed

- Change client method names (e.g. `#programs` to `#list_programs`).

## [0.3.1] - 2014-05-04

### Added

- Client#programs supports `:include` option for eager-loading related resources.

## [0.3.0] - 2014-05-04

### Changed

- SyoboiCalendar::Client returns an Array of resources.

## [0.2.1] - 2014-04-28

### Changed

- SyoboiCalendar::Client returns a Hashie::Mash as a response.

## [0.2.0] - 2014-04-28

### Added

- Support GET /db.php API.

### Changed

- Remake SyoboiCalendar::Client from scratch.

[0.9.4]: https://github.com/r7kamura/syoboi_calendar/compare/v0.9.3...v0.9.4
[0.9.3]: https://github.com/r7kamura/syoboi_calendar/compare/v0.9.2...v0.9.3
[0.9.2]: https://github.com/r7kamura/syoboi_calendar/compare/v0.9.1...v0.9.2
[0.9.1]: https://github.com/r7kamura/syoboi_calendar/compare/v0.9.0...v0.9.1
[0.9.0]: https://github.com/r7kamura/syoboi_calendar/compare/v0.8.0...v0.9.0
[0.8.0]: https://github.com/r7kamura/syoboi_calendar/compare/v0.7.0...v0.8.0
[0.7.0]: https://github.com/r7kamura/syoboi_calendar/compare/v0.6.1...v0.7.0
[0.6.1]: https://github.com/r7kamura/syoboi_calendar/compare/v0.6.0...v0.6.1
[0.6.0]: https://github.com/r7kamura/syoboi_calendar/compare/v0.5.1...v0.6.0
[0.5.1]: https://github.com/r7kamura/syoboi_calendar/compare/v0.5.0...v0.5.1
[0.5.0]: https://github.com/r7kamura/syoboi_calendar/compare/v0.4.0...v0.5.0
[0.4.0]: https://github.com/r7kamura/syoboi_calendar/compare/v0.3.1...v0.4.0
[0.3.1]: https://github.com/r7kamura/syoboi_calendar/compare/v0.3.0...v0.3.1
[0.3.0]: https://github.com/r7kamura/syoboi_calendar/compare/v0.2.1...v0.3.0
[0.2.1]: https://github.com/r7kamura/syoboi_calendar/compare/v0.2.0...v0.2.1
[0.2.0]: https://github.com/r7kamura/syoboi_calendar/compare/v0.1.3...v0.2.0
