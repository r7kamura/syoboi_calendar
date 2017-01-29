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

### Create an instance of SyoboiCalendar::Client

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

### SyoboiCalendar::Resources::Title#category_id

```ruby
client.list_titles(title_id: 1).first.category_id
```

<details>
<summary>Result</summary>

```
10
```

</details>

### SyoboiCalendar::Resources::Title#comment

```ruby
client.list_titles(title_id: 1).first.comment
```

<details>
<summary>Result</summary>

```
*リンク
-[[J.C.STAFF http://www.jcstaff.co.jp/sho-sai/maho-shokai/maho-story.htm]]
-[[『魔法遣いに大切なこと』オフィシャルサイト archive://www.yume-mahou.com/]]
*スタッフ
:監督:下田正美
:原作・脚本:山田典枝
:掲載:月刊コミックドラゴン(角川書店)
:キャラクター原案:よしづきくみち
:キャラクターデザイン:千葉道徳
:総作画監督:川崎恵子
:コンセプト・ワークス:横田耕三、幡池裕行
:美術監督:西川淳一郎
:色彩設定:石田美由紀
:撮影監督:秋元央
:編集:西山茂(タバック)
:音響監督:田中英行(オーディオ・タナカ)
:音楽:羽毛田丈史
:音楽プロデューサー:廣井紀彦(パイオニアLDC)
:音楽ディレクター:和田亨(キックアップ)
:音楽協力:テレビ朝日ミュージック
:録音調整:小原吉男
:音響効果:今野康之(スワラプロ)
:選曲:神保直史
:録音助手:国分政嗣
:録音スタジオ:タバック
:音響制作:オーディオ・タナカ
:キャスティング協力:好永伸恵
:ポストプロダクション:東京現像所
:広報:小出わかな(テレビ朝日)
:宣伝プロデュース:小林　剛(角川大映)、飯田尚史(パイオニアLDC)
:アシスタントプロデューサー:佐々木美和(パイオニアLDC)
:プロデューサー:清水俊(角川大映)、藤田敏(角川大映)、河野勝(テレビ朝日)、松田章男(パイオニアLDC)
:アニメーションプロデューサー:新崎力也(Viewworks)、松倉友二(J.C.STAFF)
:企画:角川大映、テレビ朝日、パイオニアLDC、東北新社、電通、日販、角川書店
:アニメーション制作:ヴューワークス、J.C.STAFF
:制作:魔法局、テレビ朝日
*キャスト
:菊池ユメ:宮﨑あおい
:小山田雅美:諏訪部順一
:ケラ(加藤剛):飯田浩志
:アンジェラ:渡辺明乃
:遠藤耕三:中博史
:古崎力哉:清川元夢
:森川瑠奈:石毛佐和
:ギンプン:辻谷耕史
:ミリンダ:平松晶子
*オープニング 「風の花」
:作詞・作曲:おのまきこ
:編曲:清水信之
:歌:花＊花
*エンディング 「UNDER THE BLUE SKY」
:作詞:田岡美樹
:作曲・編曲:市川裕一
:編曲:羽毛田丈史
:歌:the Indigo
```

</details>

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
