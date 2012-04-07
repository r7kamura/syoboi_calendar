# encoding: UTF-8

require "spec_helper"

describe "SyoboiCalendar::Title" do
  before do
    @title = SyoboiCalendar::Title.new(
      :tid  => "2466",
      :name => "アクセル・ワールド",
    )
  end

  describe "#url" do
    before do
      @title.stub(:comment) {
        %w[
          *リンク
          -[[テレビ東京$http://www.tv-tokyo.co.jp/anime/mukashibanashi/]]
          *スタッフ
          *オープニングテーマ「一人のキミが生まれたとさ」
          :作詞・作曲:大倉智之(INSPi)
          :編曲:吉田圭介(INSPi)、貞国公洋
          :コーラス:INSPi
          :歌:中川翔子
          *エンディングテーマ「あるこう」
          :作詞:吉田圭介(INSPi)、大倉智之(INSPi)
          :作曲:吉田圭介(INSPi)
          :編曲:齋藤真也
          :歌:中川翔子
          *キャスト
          :語り手:柄本明
          :語り手:松金よね子
        ].join("\r\n").gsub("$", " ")
      }
    end

    it "return url of official website" do
      @title.url.should == "http://www.tv-tokyo.co.jp/anime/mukashibanashi/"
    end
  end


   def linkify_url(str)
    replaced_uris = []
    URI.extract(str.dup, %w[http https ftp]) do |uri|
      next if replaced_uris.include?(uri)
      replaced_uris << uri
      str = str.gsub(uri, %Q{<a href="#{uri}" target="_blank">#{uri}</a>}).html_safe
    end
    str
  end
end
