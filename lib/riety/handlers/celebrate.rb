module Riety
  module Handlers
    class Celebrate < Ruboty::Handlers::Base
      on(
        /(celebrate|お祝い)((\s|　)+|((\s|　)+(?<keyword>.+)))?\z/,
        name: 'celebrate',
        command: 'celebrate(or お祝い) 名前',
        description: "みんなからのお祝い (例: @#{ENV['ROBOT_NAME']} celebrate きたむら) | 名簿を見たかったら list オプション"
      )

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

        def messages
          @messages ||= YAML.load_file(file_path)
        end

        def member_list
          messages.keys.join("\n")
        end

        def massage_from(who: )
          messages[who]
        end

        end

        def file_path
          File.join(File.expand_path('../../db', __FILE__), 'celebrate.yml')
        end
    end
  end
end
