module Riety
  module Handlers
    class Celebrate < Ruboty::Handlers::Base
      on /celebrate/, name: 'celebrate', description: "みんなからのお祝い(例： #{ENV['ROBOT_NAME']} celebrate きたむら)"

      def celebrate(message)
        name = message.body.split(' ')[2]
        return message.reply '名前を指定してください＼(^o^)／' unless name

        message.reply name
        # name の人のメッセージを表示する
      end
    end
  end
end
