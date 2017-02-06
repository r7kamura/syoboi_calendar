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
- Add `TID=*` query if no `:title_id` option given on `#list_titles`

## 0.4.0

- Change client method names (e..g `#programs` to `#list_programs`)

## 0.3.1

- Client#programs supports `:include` option for eage-loading related resources

## 0.3.0

- SyoboiCalendar::Client returns an Array of resources

## 0.2.1

- SyoboiCalendar::Client returns a Hashie::Mash as a response

## 0.2.0

- Remake SyoboiCalendar::Client from scratch
- Support GET /db.php API
