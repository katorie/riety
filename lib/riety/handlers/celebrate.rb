module Riety
  module Handlers
    class Celebrate < Ruboty::Handlers::Base
      on /(celebrate|お祝い)((\s|　)+(?<keyword>.+))?\z/, name: 'celebrate', description: "みんなからのお祝い(例: @#{ENV['ROBOT_NAME']} celebrate きたむら) | 名簿を見たかったら list オプション"

      def celebrate(message)
        name = message[:keyword]
        return message.reply '名前を指定してください＼(^o^)／' unless name
        return message.reply member_list if name == 'list'

        msg = massage_from(who: name)
        if msg
          message.reply msg
        else
          message.reply "#{name} さんからはまだメッセージが来てないようですね :santa:"
        end
      end

      private
        def member_list
          YAML.load_file(file_path).keys
        end

        def massage_from(who: )
          @messages ||= YAML.load_file(file_path)
          @messages[who]
        end

        def file_path
          File.join(File.expand_path('../../db', __FILE__), 'celebrate.yml')
        end
    end
  end
end
