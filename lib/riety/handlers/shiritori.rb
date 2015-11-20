require 'yaml'

module Riety
  module Handlers
    class Shiritori < Ruboty::Handlers::Base
      on /shiritori/, name: 'shiritori', description: "しりとり (例: #{ENV['ROBOT_NAME']} shiritori うみほたる)"

      def shiritori(message)
        words = YAML.load_file(
          File.join(File.expand_path('../../db', __FILE__),
                    'words.yml'))
        if word = words[message.body[-1]]
          if word.is_a? Array
            message.reply word.sample
          else
            message.reply word
          end
        else
          message.reply 'えーひらがなで言ってくれないとわかんない...'
        end
      end
    end
  end
end
