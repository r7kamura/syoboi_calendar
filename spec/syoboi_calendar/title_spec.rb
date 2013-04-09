# encoding: UTF-8

require "spec_helper"

describe "SyoboiCalendar::Title" do
  before do
    @title = SyoboiCalendar::Title.new(
      tid: "2466",
      name: "アクセル・ワールド",
    )
    @title.stub(:comment) {
      %w[
        *リンク
        -[[公式 http://www.accel-world.net/]]
        -[[BS11デジタル http://www.bs11.jp/anime/1699/]]
        *スタッフ
        :原作:川原礫(電撃文庫)
        :原作イラスト:HIMA
        *オープニングテーマ1「Chase the world」
        :作詞:井上秋緒
        :作曲・編曲:浅倉大介
        :歌:May\'n
        :使用話数:#2～#13
        *エンディングテーマ1「→unfinished→」
        :作詞・歌:KOTOKO
        :作曲・編曲:八木沼悟志
        :使用話数:#2～#4、#6～#13
        *キャスト
        :黒雪姫／ブラック・ロータス:三澤紗千香
        :有田春雪／シルバー・クロウ:梶裕貴
      ].join("\r\n").gsub("$", " ")
    }
    @title.stub(:subtitles) { "*01*Acceleration;加速\r\n*02*Transformation;変移" }
  end

  # リンク
  describe "#url" do
    it "return url of official website" do
      @title.url.should == "http://www.accel-world.net/"
    end
  end

  # スタッフ
  it { @title.staff.should == ['川原礫(電撃文庫)', 'HIMA'] }
  it { @title.role.should == ['原作', '原作イラスト'] }
  it { @title.staff_map.should == { "原作"=>"川原礫(電撃文庫)", "原作イラスト"=>"HIMA" } }

  # キャスト
  it { @title.voice_actors.should == ['三澤紗千香', '梶裕貴'] }
  it { @title.characters.should == ['黒雪姫／ブラック・ロータス', '有田春雪／シルバー・クロウ'] }
  it { @title.voice_actor_map.should == { "黒雪姫／ブラック・ロータス"=>"三澤紗千香", "有田春雪／シルバー・クロウ"=>"梶裕貴" } }

  # サブタイトル
  it "#parsed_subtitles" do
    @title.parsed_subtitles.should == [
      { number: 1, subtitle: "Acceleration;加速" },
      { number: 2, subtitle: "Transformation;変移" }
    ]
  end
end
