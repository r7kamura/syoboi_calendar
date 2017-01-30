# SyoboiCalendar

[![CircleCI](https://circleci.com/gh/r7kamura/syoboi_calendar.svg?style=svg)](https://circleci.com/gh/r7kamura/syoboi_calendar)
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

### SyoboiCalendar::Client#list_channels

Sends an HTTP request to `http://cal.syoboi.jp/db.php?Command=ChLookup`.

```ruby
client.list_channels
```

Sends an HTTP request to `http://cal.syoboi.jp/db.php?ChID=1&Command=ChLookup`.

```ruby
client.list_channels(channel_id: 1)
```

Sends an HTTP request to `http://cal.syoboi.jp/db.php?Command=ChLookup&LastUpdate=20000101_000000-`.

```ruby
client.list_channels(updated_from: Time.new(2000, 1, 1))
```

Sends an HTTP request to `http://cal.syoboi.jp/db.php?Command=ChLookup&LastUpdate=-20000101_000000`.

```ruby
client.list_channels(updated_to: Time.new(2000, 1, 1))
```

Sends an HTTP request to `http://cal.syoboi.jp/db.php?Command=ChLookup&LastUpdate=20000101_000000-20000201_000000`.

```ruby
client.list_channels(updated_from: Time.new(2000, 1, 1), updated_to: Time.new(2000, 2, 1))
```

### SyoboiCalendar::Client#list_programs

Sends an HTTP request to `http://cal.syoboi.jp/db.php?Command=ProgLookup&JOIN=SubTitles`.

```ruby
client.list_programs
```

Sends an HTTP request to `http://cal.syoboi.jp/db.php?Command=ProgLookup&JOIN=SubTitles&PID=1`.

```ruby
client.list_programs(program_id: 1)
```

Sends an HTTP request to `http://cal.syoboi.jp/db.php?ChID=2&Command=ProgLookup&JOIN=SubTitles&PID=1`.

```ruby
client.list_programs(program_id: 1, channel_id: 2)
```

Sends an HTTP request to `http://cal.syoboi.jp/db.php?Command=ProgLookup&Count=1&JOIN=SubTitles`.

```ruby
client.list_programs(count: 1)
```

Sends an HTTP request to `http://cal.syoboi.jp/db.php?Command=ProgLookup&JOIN=SubTitles&LastUpdate=20000101_000000-`.

```ruby
client.list_programs(updated_from: Time.new(2000, 1, 1))
```

Sends an HTTP request to `http://cal.syoboi.jp/db.php?Command=ProgLookup&JOIN=SubTitles&LastUpdate=-20000101_000000`.

```ruby
client.list_programs(updated_to: Time.new(2000, 1, 1))
```

Sends an HTTP request to `http://cal.syoboi.jp/db.php?Command=ProgLookup&JOIN=SubTitles&LastUpdate=20000101_000000-20000201_000000`.

```ruby
client.list_programs(updated_from: Time.new(2000, 1, 1), updated_to: Time.new(2000, 2, 1))
```

Sends an HTTP request to `http://cal.syoboi.jp/db.php?Command=ProgLookup&JOIN=SubTitles&StTime=20000101_000000-`.

```ruby
client.list_programs(started_from: Time.new(2000, 1, 1))
```

Sends an HTTP request to `http://cal.syoboi.jp/db.php?Command=ProgLookup&JOIN=SubTitles&StTime=-20000101_000000`.

```ruby
client.list_programs(started_to: Time.new(2000, 1, 1))
```

Sends an HTTP request to `http://cal.syoboi.jp/db.php?Command=ProgLookup&JOIN=SubTitles&StTime=20000101_000000-20000201_000000`.

```ruby
client.list_programs(started_from: Time.new(2000, 1, 1), started_to: Time.new(2000, 2, 1))
```

Sends an HTTP request to `http://cal.syoboi.jp/db.php?Command=ProgLookup&JOIN=SubTitles&Range=20000101_000000-`.

```ruby
client.list_programs(played_from: Time.new(2000, 1, 1))
```

Sends an HTTP request to `http://cal.syoboi.jp/db.php?Command=ProgLookup&JOIN=SubTitles&Range=-20000101_000000`.

```ruby
client.list_programs(played_to: Time.new(2000, 1, 1))
```

Sends an HTTP request to `http://cal.syoboi.jp/db.php?Command=ProgLookup&JOIN=SubTitles&Range=20000101_000000-20000201_000000`.

```ruby
client.list_programs(played_from: Time.new(2000, 1, 1), played_to: Time.new(2000, 2, 1))
```

### SyoboiCalendar::Client#list_titles

Sends an HTTP request to `http://cal.syoboi.jp/db.php?Command=TitleLookup&TID=*`.

```ruby
client.list_titles
```

Sends an HTTP request to `http://cal.syoboi.jp/db.php?Command=TitleLookup&TID=1`.

```ruby
client.list_titles(title_id: 1)
```

Sends an HTTP request to `http://cal.syoboi.jp/db.php?Command=TitleLookupp&TID=*&LastUpdate=20000101_000000-`.

```ruby
client.list_titles(updated_from: Time.new(2000, 1, 1))
```

Sends an HTTP request to `http://cal.syoboi.jp/db.php?Command=TitleLookupp&TID=*&LastUpdate=-20000101_000000`.

```ruby
client.list_titles(updated_to: Time.new(2000, 1, 1))
```

Sends an HTTP request to `http://cal.syoboi.jp/db.php?Command=TitleLookupp&TID=*&LastUpdate=20000101_000000-20000201_000000`.

```ruby
client.list_titles(updated_from: Time.new(2000, 1, 1), updated_to: Time.new(2000, 2, 1))
```

### SyoboiCalendar::Resources::ChannelResource#comment

```ruby
client.list_channels.first.comment
```

<details>
<summary>Result</summary>

```ruby
"http://jk.nicovideo.jp/watch/jk1"
```

</details>

### SyoboiCalendar::Resources::ChannelResource#epg_url

```ruby
client.list_channels.first.epg_url
```

<details>
<summary>Result</summary>

```ruby
"http://www2.nhk.or.jp/hensei/program/wk.cgi?tz=all&ch=21"
```

</details>

### SyoboiCalendar::Resources::ChannelResource#group_id

```ruby
client.list_channels.first.group_id
```

<details>
<summary>Result</summary>

```ruby
11
```

</details>

### SyoboiCalendar::Resources::ChannelResource#id

```ruby
client.list_channels.first.id
```

<details>
<summary>Result</summary>

```ruby
1
```

</details>

### SyoboiCalendar::Resources::ChannelResource#iepg_name

```ruby
client.list_channels.first.iepg_name
```

<details>
<summary>Result</summary>

```ruby
"ＮＨＫ総合"
```

</details>

### SyoboiCalendar::Resources::ChannelResource#number

```ruby
client.list_channels.first.number
```

<details>
<summary>Result</summary>

```ruby
1
```

</details>

### SyoboiCalendar::Resources::ChannelResource#url

```ruby
client.list_channels.first.url
```

<details>
<summary>Result</summary>

```ruby
"http://www.nhk.or.jp/"
```

</details>

### SyoboiCalendar::Resources::ProgramResource#channel_id

```ruby
client.list_programs.first.channel_id
```

<details>
<summary>Result</summary>

```ruby
6
```

</details>

### SyoboiCalendar::Resources::ProgramResource#comment

```ruby
client.list_programs[96].comment
```

<details>
<summary>Result</summary>

```ruby
"!都合によりEPISODE7を再放送"
```

</details>

### SyoboiCalendar::Resources::ProgramResource#count

```ruby
client.list_programs.first.count
```

<details>
<summary>Result</summary>

```ruby
12
```

</details>

### SyoboiCalendar::Resources::ProgramResource#deleted?

```ruby
client.list_programs.first.count
```

<details>
<summary>Result</summary>

```ruby
false
```

</details>

### SyoboiCalendar::Resources::ProgramResource#finished_at

```ruby
client.list_programs.first.finished_at.to_s
```

<details>
<summary>Result</summary>

```ruby
"2003-03-28 02:37:00 +0900"
```

</details>

### SyoboiCalendar::Resources::ProgramResource#flag

```ruby
client.list_programs.first.flag
```

<details>
<summary>Result</summary>

```ruby
0
```

</details>

### SyoboiCalendar::Resources::ProgramResource#revision

```ruby
client.list_programs.first.revision
```

<details>
<summary>Result</summary>

```ruby
0
```

</details>

### SyoboiCalendar::Resources::ProgramResource#started_at

```ruby
client.list_programs.first.started_at.to_s
```

<details>
<summary>Result</summary>

```ruby
"2003-03-28 02:07:00 +0900"
```

</details>

### SyoboiCalendar::Resources::ProgramResource#sub_title

```ruby
client.list_programs.first.sub_title
```

<details>
<summary>Result</summary>

```ruby
"魔法遣いに大切なこと"
```

</details>

### SyoboiCalendar::Resources::ProgramResource#title_id

```ruby
client.list_programs.first.title_id
```

<details>
<summary>Result</summary>

```ruby
1
```

</details>

### SyoboiCalendar::Resources::ProgramResource#updated_at

```ruby
client.list_programs.first.updated_at.to_s
```

<details>
<summary>Result</summary>

```ruby
"2003-03-27 03:38:14 +0900"
```

</details>

### SyoboiCalendar::Resources::ProgramResource#warn

```ruby
client.list_programs.first.warn
```

<details>
<summary>Result</summary>

```ruby
1
```

</details>

### SyoboiCalendar::Resources::TitleResource#category_id

```ruby
client.list_titles(title_id: 1).first.category_id
```

<details>
<summary>Result</summary>

```ruby
10
```

</details>

### SyoboiCalendar::Resources::TitleResource#comment

```ruby
client.list_titles(title_id: 1).first.comment
```

<details>
<summary>Result</summary>

```ruby
"*リンク\n-[[J.C.STAFF http://www.jcstaff.co.jp/sho-sai/maho-shokai/maho-story.htm]]\n-[[『魔法遣いに大切なこと』オフィシャルサイト archive://www.yume-mahou.com/]]\n*スタッ フ\n:監督:下田正美\n:原作・脚本:山田典枝\n:掲載:月刊コミックドラゴン(角川書店)\n:キャラクター原案:よしづきくみち\n:キャラクターデザイン:千葉道徳\n:総作画監督:川崎恵子\n:コンセプト・ワークス:横田耕三、幡池裕行\n:美術監督:西川淳一郎\n:色彩設定:石田美由紀\n:撮影監督:秋元央\n:編集:西山茂(タバック)\n:音響監督:田中英行(オーディオ・タナカ)\n:音楽:羽毛田丈史\n:音楽プロデューサー:廣井紀彦(パイオニアLDC)\n:音楽ディレクター:和田亨(キックアップ)\n:音楽協力:テレビ朝日ミュージック\n:録音調整:小原吉男\n:音響効果:今野康之(スワラ プロ)\n:選曲:神保直史\n:録音助手:国分政嗣\n:録音スタジオ:タバック\n:音響制作:オーディオ・タナカ\n:キャスティング協力:好永伸恵\n:ポストプロダクション:東京現像所\n:広報:小出わかな(テレビ朝日)\n:宣伝プロデュース:小林　剛(角川大映)、飯田尚史(パイオニアLDC)\n:アシスタントプロデューサー:佐々木美和(パイオニアLDC)\n:プロデューサー:清水俊(角川大映)、藤 田敏(角川大映)、河野勝(テレビ朝日)、松田章男(パイオニアLDC)\n:アニメーションプロデューサー:新崎力也(Viewworks)、松倉友二(J.C.STAFF)\n:企画:角川大映、テレビ朝日、パイオニアLDC、東北新社、電通、日販、角川書店\n:アニメーション制作:ヴューワークス、J.C.STAFF\n:制作:魔法局、テレビ朝日\n*キャスト\n:菊池ユメ:宮﨑あおい\n:小山田雅美:諏訪部順一\n:ケラ(加藤剛):飯田浩志\n:アンジェラ:渡辺明乃\n:遠藤耕三:中博史\n:古崎力哉:清川元夢\n:森川瑠奈:石毛佐和\n:ギンプン:辻谷耕史\n:ミリンダ:平松晶子\n*オープニング 「風の花」\n:作詞・作曲:おのまきこ\n:編曲:清水信之\n:歌:花＊花\n*エンディング 「UNDER THE BLUE SKY」\n:作詞:田岡美樹\n:作曲・編曲:市川裕一\n:編曲:羽毛田丈史\n:歌:the Indigo"
```

</details>

### SyoboiCalendar::Resources::TitleResource#english_name

```ruby
client.list_titles(title_id: 8).first.english_name
```

<details>
<summary>Result</summary>

```ruby
"AIR MASTER"
```

</details>

### SyoboiCalendar::Resources::TitleResource#first_channel

```ruby
client.list_titles(title_id: 1).first.first_channel
```

<details>
<summary>Result</summary>

```ruby
"テレビ朝日"
```

</details>

### SyoboiCalendar::Resources::TitleResource#first_end_month

```ruby
client.list_titles(title_id: 1).first.first_end_month
```

<details>
<summary>Result</summary>

```ruby
3
```

</details>

### SyoboiCalendar::Resources::TitleResource#first_end_year

```ruby
client.list_titles(title_id: 1).first.first_end_year
```

<details>
<summary>Result</summary>

```ruby
2003
```

</details>

### SyoboiCalendar::Resources::TitleResource#first_month

```ruby
client.list_titles(title_id: 1).first.first_month
```

<details>
<summary>Result</summary>

```ruby
1
```

</details>

### SyoboiCalendar::Resources::TitleResource#first_year

```ruby
client.list_titles(title_id: 1).first.first_year
```

<details>
<summary>Result</summary>

```ruby
2003
```

</details>

### SyoboiCalendar::Resources::TitleResource#flag

```ruby
client.list_titles(title_id: 1).first.flag
```

<details>
<summary>Result</summary>

```ruby
0
```

</details>

### SyoboiCalendar::Resources::TitleResource#id

```ruby
client.list_titles(title_id: 1).first.id
```

<details>
<summary>Result</summary>

```ruby
1
```

</details>

### SyoboiCalendar::Resources::TitleResource#kana

```ruby
client.list_titles(title_id: 1).first.kana
```

<details>
<summary>Result</summary>

```ruby
"まほうつかいにたいせつなこと"
```

</details>

### SyoboiCalendar::Resources::TitleResource#keywords

```ruby
client.list_titles(title_id: 2).first.keywords
```

<details>
<summary>Result</summary>

```ruby
"ソニックX"
```

</details>

### SyoboiCalendar::Resources::TitleResource#point

```ruby
client.list_titles(title_id: 1).first.point
```

<details>
<summary>Result</summary>

```ruby
4
```

</details>

### SyoboiCalendar::Resources::TitleResource#rank

```ruby
client.list_titles(title_id: 1).first.rank
```

<details>
<summary>Result</summary>

```ruby
2825
```

</details>

### SyoboiCalendar::Resources::TitleResource#short_title

```ruby
client.list_titles(title_id: 4).first.short_title
```

<details>
<summary>Result</summary>

```ruby
"ワンダバスタイル"
```

</details>

### SyoboiCalendar::Resources::TitleResource#sub_titles

```ruby
client.list_titles(title_id: 1).first.sub_titles
```

<details>
<summary>Result</summary>

```ruby
"*001*夕焼けと鉄骨・前編\n*002*夕焼けと鉄骨・後編\n*003*最高のニュース\n*004*夏の夜と魔法遣い\n*005*エプロンとシャンパン\n*006*魔法遣いになりたい\n*007*魔法遣いになれなかっ た魔法遣い\n*008*恋のバカヂカラ\n*009*ユメと少女と夏の種\n*010*魔法の行方\n*011*折れてしまった虹\n*012*魔法遣いに大切なこと"
```

</details>

## Documentation

See API documentation at http://www.rubydoc.info/github/r7kamura/syoboi_calendar.
