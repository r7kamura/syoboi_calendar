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
