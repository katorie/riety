module Riety
  module Handlers
    class Celebrate < Ruboty::Handlers::Base
      on /celebrate/, name: 'celebrate', description: "みんなからのお祝い(例： #{ENV['ROBOT_NAME']} celebrate きたむら)"

      def celebrate(message)
        name = message.body.split(' ')[2]
        return message.reply '名前を指定してください＼(^o^)／' unless name

        msg = get_massage_from(who: name)
        if msg
          message.reply msg
        else
          message.reply "#{name} さんからはまだメッセージが来てないようですね :santa:"
        end
      end

      private

        def get_massage_from(who: 'サンプル')
          @messages ||= YAML.load_file(file_path)
          @messages[who]
        end

        def file_path
          File.join(File.expand_path('../../db', __FILE__), 'celebrate.yml')
        end
    end
  end
end
