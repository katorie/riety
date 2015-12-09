module Riety
  module Handlers
    class Celebrate < Ruboty::Handlers::Base
      on(
        /(celebrate|お祝い)((\s|　)+|((\s|　)+(?<keyword>.+)))?\z/,
        name: 'celebrate',
        command: 'celebrate(or お祝い)',
        description: "みんなからのお祝い | 名簿を見るには (@#{ENV['ROBOT_NAME']} celebrate list) | 個別メッセージは (@#{ENV['ROBOT_NAME']} celebrate 名前)"
      )

      def celebrate(message)
        name = message[:keyword]
        unless name
          all_messages do |msg|
            message.reply msg
          end
          return
        end
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

        def all_messages
          yield <<-EOS
#{':rose:' * 13}  
:memo:&nbsp;__yochiyochi.rb celebration messages!__  
#{':rose:' * 13}
          EOS
          wait_a_bit
          messages.each do |message|
            next if message[0] == "サンプル"
            yield <<-EOS
:love_letter:&nbsp;__A message from #{message[0]}__
#{message[1]}
            EOS
            wait_a_bit
          end
        end

        def wait_a_bit
          sleep 1.5
        end

        def file_path
          File.join(File.expand_path('../../db', __FILE__), 'celebrate.yml')
        end
    end
  end
end
