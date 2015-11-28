module Riety
  module Handlers
    class Message < Ruboty::Handlers::Base
      on /message/, name: 'message', description: "みんなからのメッセージ(例： #{ENV['ROBOT_NAME']} message きたむら)"

      def message(name)
        # name の人のメッセージを表示する
      end
    end
  end
end
