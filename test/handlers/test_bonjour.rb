require './test/test_helper'

class BonjourTest < Minitest::Test
  def setup
    super
    @tweet_messages = [
      "bonjour !",
      "今日もいい日だ",
      "J'ai du mal à imaginer.",
      "おやつの時間",
      "なにしてるの？",
      "T’exagères, quand même !",
      "Je m'ennuie.",
      "une petite trentaine",
      "かまへん、かまへん",
      "Comment allez-vous ?",
      "ぼんじゅー",
      "C'est mignon !",
      "C'est fascinant !",
      "Ce n'est pas péjoratif.",
      "ほんまやなー",
      "ﾃｯﾃﾚｰ!",
      "Il m'a confie le chocolat.",
      "une petite distance",
      "いかがおすごしですか",
      "Je suis trés timide.",
      "今日のごはんはなにかなー",
      "Il reste 10 jours.",
      "À bientôt !",
      "Il camoufle le probleme.",
      "hi",
      "Tu m'empêche de dormir.",
      "げんき？",
      "À tout à l'heure.",
      "Éloge de la fuite.",
      "どないしたん",
      "Il veut prendre sa revanche.",
      "ぼっとだよ"
    ]
  end

  def test_bonjour_return_message
    assert_includes @tweet_messages, riety_message
  end

  private

  def riety_message
    out = StringIO.new
    $stdout = out
    @bot.receive body: "@riety bonjour", from: @from, to: @to
    return out.string.chomp
  end
end
