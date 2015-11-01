module Ruboty
  module Handlers
    class Hello < Base
      on /hello/, name: 'hello', description: 'greet'

      def hello(message)
        message.reply 'Hi'
      end
    end
  end
end
