require 'yaml'

module Riety
  module Handlers
    class Shiritori < Ruboty::Handlers::Base
      on /shiritori/, name: 'shiritori', description: 'しりとり'

      def shiritori(message)
        words = YAML.load_file(
          File.join(File.expand_path('../../db', __FILE__),
                    'words.yml'))
        if word = words[message.body[-1]]
          message.reply word
        else
          message.reply 'えーひらがなで言ってくれないとわかんない...'
        end
      end
    end
  end
end
