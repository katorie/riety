module Riety
  module Handlers
    class Bonjour < Ruboty::Handlers::Base
      on(
        /bonjour\z/,
        name: 'bonjour',
        command: 'bonjour',
        description: 'greet like a well-known tweet bot'
      )

      def bonjour(message)
        message.reply tweet_messages.sample
      end

      private

      def tweet_messages
        [
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
          "Il veut prendre sa revanche."
        ]
      end
    end
  end
end
