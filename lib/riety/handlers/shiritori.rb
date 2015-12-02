require 'yaml'

module Riety
  module Handlers
    class Shiritori < Ruboty::Handlers::Base
      on /(shiritori|しりとり)((\s|　)+(?<keyword>.+))?\z/, name: 'shiritori', description: "しりとり (例: @#{ENV['ROBOT_NAME']} shiritori うみほたる、@#{ENV['ROBOT_NAME']} しりとり はんばーぐ)"

      def shiritori(message)
        return message.reply 'なんか言ってくれないとしりとりできない...' unless message[:keyword]

        word = words[message[:keyword][-1]]
        return message.reply 'えーひらがなで言ってくれないとわかんない...' unless word

        if word.is_a? Array
          message.reply word.sample
        else
          message.reply word
        end
      end

      private

        def words
          @words ||= YAML.load_file(file_path)
        end

        def file_path
          File.join(File.expand_path('../../db', __FILE__), 'words.yml')
        end
    end
  end
end
